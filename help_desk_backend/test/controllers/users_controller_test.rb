require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  test "registers a valid user" do
    post "/auth/register", params: {
      user: {
        username: "alice",
        password: "password123",
        password_confirmation: "password123"
      }
    }

    assert_response :created
    body = JSON.parse(response.body)
    assert_equal "alice", body["user"]["username"]
    assert_not_nil body["token"]
  end
  
end
