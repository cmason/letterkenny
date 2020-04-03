require "application_system_test_case"

class RandomQuotesTest < ApplicationSystemTestCase
  test "visiting the root" do
    visit root_url

    assert_selector "h1.quote"

    click_on "Have another?"
    assert_equal current_path, "/random"
  end

  test "get random quote" do
    visit random_quote_url

    assert_selector "h1.quote"
    assert has_link?("Have another?")
  end

  test "get random quote from a specific character" do
    visit random_character_quote_url(slug: "katy")

    assert_selector "h2.author", text: "Katy"

    click_on "Have another?"
    assert_equal current_path, "/random/katy"
  end
end
