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

  # GET /expert/queue: get the expert queue (waiting and assigned conversations)
  test "GET /expert/queue returns waiting and assigned conversations" do
    # Create a waiting conversation (no expert assigned)
    waiting_conversation = Conversation.create!(
      title: "Waiting Question",
      initiator: @user,
      status: "waiting",
    )
  
    # Create an assigned conversation (assigned to this expert)
    assigned_conversation = Conversation.create!(
      title: "Assigned Question Test",
      initiator: @user,
      status: "active",
      assigned_expert: @user
    )
  
    get "/expert/queue", headers: @headers
    assert_response :success
  
    json = JSON.parse(@response.body)
  
    # Validate structure
    assert json.key?("waitingConversations")
    assert json.key?("assignedConversations")
  
    # Validate waiting list
    waiting_ids = json["waitingConversations"].map { |c| c["id"].to_i }
    puts "waiting ids: #{waiting_ids}"
    puts "waiting conversation id: #{waiting_conversation.id}"
    assert_includes waiting_ids, waiting_conversation.id
  
    # Validate assigned list
    assigned_ids = json["assignedConversations"].map { |c| c["id"].to_i }
    puts "assigned ids: #{assigned_ids}"
    puts "assigned conversation id: #{assigned_conversation.id}"
    assert_includes assigned_ids, assigned_conversation.id
  end
  

  # POST /expert/conversations/:conversation_id/claim: claim a conversation as an expert.

  # POST /expert/conversations/:conversation_id/unclaim: unclaim a conversation (return it to the waiting queue).

  # PUT /expert/profile: update the expert's profile.

  # GET /expert/assignments/history: get the expert's assignment history.

end
