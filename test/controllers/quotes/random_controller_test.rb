require "test_helper"

class Quotes::RandomControllerTest < ActionDispatch::IntegrationTest
  test "should get random quotes" do
    get quotes_random_url
    assert_response :success
  end

  test "should get random quote from a specific character" do
    get quotes_random_character_url(slug: characters(:katy).slug)
    assert_response :success
  end

  test "should gracefully handle request from unknown characters" do
    get quotes_random_character_url(slug: "unknown_character")
    assert_response :not_found
  end
end
