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

  # The slack_sign_in gem passes the results of the slack sign in flow to the
  # controller as a flash message. We can simulate failed or successful authentication
  # attempts by crafting the flash message, avoiding having to do the oauth dance
  # during testing.

  def slack_successful_authentication(user)
    {
      ActionDispatch::Flash::KEY => ActionDispatch::Flash::FlashHash.new(
        slack_sign_in: {"success" => {
          "ok" => true,
          "scope" => "identity.basic,identity.email,identity.avatar,identity.team",
          "user_id" => user.slack_user_id,
          "team_id" => user.slack_team_id,
          "enterprise_id" => nil,
          "user" => {
            "name" => user.name,
            "id" => user.slack_user_id,
            "image_24" => "https://example.com/24.png",
            "image_32" => "https://example.com/32.png",
            "image_48" => "https://example.com/48.png",
            "image_72" => "https://example.com/72.png",
            "image_192" => "https://example.com/192.png",
            "image_512" => "https://example.com/512.png"
          },
          "team" => {
            "id" => user.slack_team_id
          }
        }}
      )
    }
  end

  def slack_failed_authentication
    {ActionDispatch::Flash::KEY => ActionDispatch::Flash::FlashHash.new(
      {slack_sign_in: {
        "error" => "invalid_scope_requested"
      }}
    )}
  end

  def new_user
    id = SecureRandom.uuid
    User.new(name: "New Guy", slack_unique_id: id, slack_user_id: id, slack_team_id: id, avatar_url: "https://example.com/32.png")
  end
end
