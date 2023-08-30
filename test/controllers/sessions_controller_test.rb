require "test_helper"
require "slack_sign_in/minitest"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  include AbstractController::Translation

  def setup
    @user = users(:slack)
  end

  test "should login user from slack" do
    get create_session_url, env: slack_successful_authentication(@user)
    assert_equal t("sessions.create.success", name: @user.name), flash[:notice]
    assert_equal @user.id, session[:user_id]
    assert_redirected_to root_path
  end

  test "should alert user if unable to authenticate with slack" do
    get create_session_url, env: slack_failed_authentication
    assert_equal t(:invalid_scope_requested), flash[:alert]
    assert_nil session[:user_id]
    assert_redirected_to root_path
  end

  test "should be able to log out" do
    get destroy_session_url
    assert_nil session[:user_id]
    assert_equal t("sessions.destroy.success"), flash[:notice]
    assert_redirected_to root_path
  end

  test "should create and login a user if doesn't exist" do
    assert_difference("User.count") do
      get create_session_url, env: slack_successful_authentication(new_user)
    end
    assert_equal t("sessions.create.success", name: new_user.name), flash[:notice]
    assert_not_nil session[:user_id]
    assert_redirected_to root_path
  end

  def new_user
    id = SecureRandom.uuid
    User.new(name: "New Guy", slack_unique_id: id, slack_user_id: id, slack_team_id: id, avatar_url: "https://example.com/32.png")
  end
end
