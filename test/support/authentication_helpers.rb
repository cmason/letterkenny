module AuthenticationHelpers
  def log_in
    visit root_url
    assert has_button?("Sign in with Slack")
    click_on "Sign in with Slack"
  end

  def log_out
    visit destroy_session_url
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
end
