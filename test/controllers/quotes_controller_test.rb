require "test_helper"

class QuotesControllerTest < ActionDispatch::IntegrationTest
  test "should get random" do
    get random_quote_url
    assert_response :success
  end
end
