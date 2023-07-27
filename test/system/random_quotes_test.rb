require "application_system_test_case"

class RandomQuotesTest < ApplicationSystemTestCase
  test "visiting the root" do
    visit root_url

    assert has_link?("Get a Quote")
  end

  test "get random quote" do
    visit quotes_random_path

    assert_quote_rendered
  end

  test "get random quote from a specific character" do
    visit quotes_random_character_path(slug: "katy")

    assert_selector "h2.author", text: "Katy"
    assert_quote_rendered

    click_on "Random Katy Quote"

    assert has_link?("Random Katy Quote")
  end
end
