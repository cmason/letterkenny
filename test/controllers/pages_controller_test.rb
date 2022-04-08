require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get pages_about_url
    assert_response :success
    assert_equal "about", @controller.action_name
  end

  test "should get root" do
    get root_path
    assert_response :success
    assert_equal "root", @controller.action_name
  end
end
