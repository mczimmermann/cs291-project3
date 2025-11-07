require "test_helper"

class ExpertsControllerTest < ActionDispatch::IntegrationTest

  setup do

    @user = User.create!(
      username: "expert_user",
      password: "password123",
      password_confirmation: "password123",
      last_active_at: Time.current
    )

    @expert_profile = ExpertProfile.create!(user_id: @user.id, bio: "Expert Bio")

    @token = JwtService.encode(@user)

    @headers = {
      "Authorization" => "Bearer #{@token}",
      "Content-Type" => "application/json"
    }
  end

  # GET /expert/profile: get the current expert's profile.
  test "GET /expert/profile returns expert profile" do
    get "/expert/profile", headers: @headers
    assert_response :success

    json = JSON.parse(@response.body)
    assert_equal @expert_profile.id, json["id"]
  end

  # POST /expert/conversations/:conversation_id/claim: claim a conversation as an expert
  test "POST /expert/conversations/:conversation_id/claim assigns conversation to expert" do

    conversation = Conversation.create!(
      title: "Unclaimed Convo!",
      initiator: @user,
      status: "waiting"
    )

    post "/expert/conversations/#{conversation.id}/claim",
      headers: @headers

    assert_response :success

    json = JSON.parse(@response.body)
    assert json["success"]

    # reload conversation and verify expert assignment
    conversation.reload
    assert_equal @expert_profile.user_id, conversation.assigned_expert.id
    assert_equal "active", conversation.status

    # make sure ExpertAssignment is created
    assignment = ExpertAssignment.find_by(conversation: conversation, expert_id: @expert_profile.id)
    assert_not_nil assignment
    assert_equal "active", assignment.status
  end

  
  # POST /expert/conversations/:conversation_id/unclaim: unclaim a conversation (return it to the waiting queue).
  test "POST /expert/conversations/:conversation_id/unclaim unassigns the conversation" do

    conversation = Conversation.create!(
      title: "Assigned Conversation",
      initiator: @user,
      status: "active",
      assigned_expert: @expert_profile.user
    )

    assignment = ExpertAssignment.create!(
      conversation: conversation,
      expert_id: @expert_profile.id,
      status: "active",
      assigned_at: Time.current
    )

    post "/expert/conversations/#{conversation.id}/unclaim",
      headers: @headers

    assert_response :success
    json = JSON.parse(@response.body)
    assert json["success"]

    conversation.reload
    assert_nil conversation.assigned_expert
    assert_equal "waiting", conversation.status

    assignment.reload
    assert_equal "resolved", assignment.status
    assert_not_nil assignment.resolved_at
  end


  # PUT /expert/profile: update the expert's profile.

  # GET /expert/assignments/history: get the expert's assignment history.

    # GET /expert/queue: get the expert queue (waiting and assigned conversations)
  # test "GET /expert/queue returns waiting and assigned conversations" do

  #   waiting_conversation = Conversation.create!(
  #     title: "Waiting Question",
  #     initiator: @user,
  #     status: "waiting",
  #   )
  
  #   assigned_conversation = Conversation.create!(
  #     title: "Assigned Question Test",
  #     initiator: @user,
  #     status: "active",
  #     assigned_expert: @expert_profile.user
  #   )
  
  #   get "/expert/queue", headers: @headers
  #   assert_response :success
  
  #   json = JSON.parse(@response.body)
  
  #   assert json.key?("waitingConversations")
  #   assert json.key?("assignedConversations")
  
  #   waiting_ids = json["waitingConversations"].map { |c| c["id"].to_i }
  #   puts "waiting ids: #{waiting_ids}"
  #   puts "waiting conversation id: #{waiting_conversation.id}"
  #   assert_includes waiting_ids, waiting_conversation.id
  
  #   assigned_ids = json["assignedConversations"].map { |c| c["id"].to_i }
  #   puts "assigned ids: #{assigned_ids}"
  #   puts "assigned conversation id: #{assigned_conversation.id}"
  #   assert_includes assigned_ids, assigned_conversation.id
  # end
end
