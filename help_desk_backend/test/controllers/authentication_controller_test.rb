require "test_helper"

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(
      username: "testuser",
      password: "password123",
      password_confirmation: "password123"
    )
  end

  test "should register a new user" do
    post "/auth/register", params: {
      username: "new_user",
      password: "secretpass"
    }

    assert_response :created
    json = JSON.parse(response.body)

    assert_equal json["user"]["username"], "new_user"
    assert json["token"].present?
  end

  test "should not register duplicate username" do
    post "/auth/register", params: {
      username: @user.username,
      password: "anotherpass"
    }

    assert_response :unprocessable_entity
    json = JSON.parse(response.body)
    assert_includes json["errors"], "Username has already been taken"
  end

  test "should login with valid credentials" do
    post "/auth/login", params: {
      username: @user.username,
      password: "password123"
    }

    assert_response :success
    json = JSON.parse(response.body)
    assert_equal @user.username, json["user"]["username"]
    assert json["token"].present?
  end

  test "should reject invalid login" do
    post "/auth/login", params: {
      username: @user.username,
      password: "wrongpass"
    }

    assert_response :unauthorized
    json = JSON.parse(response.body)
    assert_equal "Invalid username or password", json["error"]
  end

  test "should return current user info from /auth/me" do
    token = JwtService.encode(user_id: @user.id)
    get "/auth/me", headers: { "Authorization" => "Bearer #{token}" }

    assert_response :success
    json = JSON.parse(response.body)
    assert_equal @user.username, json["username"]
  end

  test "should reject /auth/me without token" do
    get "/auth/me"
    assert_response :unauthorized
  end
end
