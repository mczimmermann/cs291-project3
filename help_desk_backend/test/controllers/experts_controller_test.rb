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

  test "GET /expert/profile returns expert profile" do
    get "/expert/profile", headers: @headers
    assert_response :success

    json = JSON.parse(@response.body)
    assert_equal @expert_profile.id, json["id"]
  end
end
