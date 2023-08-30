require "application_system_test_case"

class NavBarTest < ApplicationSystemTestCase
  test "when logged out the sign in with slack button is seen" do
    visit root_url
    assert_selector "button.slack-sign-in"
  end

  test "when logged in can see the admin link" do
    log_in
    assert_selector "div.signed-in-user"
    find("div.signed-in-user").click
    assert_selector "a.navbar-item", text: "Admin"
    assert_selector "a.navbar-item", text: "Sign Out"
    click_on "Sign Out"
    refute_selector "div.signed-in-user"
    assert_selector "button.slack-sign-in"
  end
end
