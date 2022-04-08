require "test_helper"

class Quotes::RandomControllerTest < ActionDispatch::IntegrationTest
  test "should get random quotes" do
    get quotes_random_url
    assert_response :redirect
  end

  test "should get random quote from a specific character" do
    get quotes_random_character_url(characters(:katy))
    assert_response :redirect
  end

  test "should gracefully handle request from unknown characters" do
    get quotes_random_character_url("unknown_character")
    assert_response :not_found
  end
end
