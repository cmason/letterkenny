require "test_helper"

class QuotesControllerTest < ActionDispatch::IntegrationTest
  test "should show quote" do
    quote = quotes(:one)
    get quote_url(quote)
    assert_response :success
  end
end
