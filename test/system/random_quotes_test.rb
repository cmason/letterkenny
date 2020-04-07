require "application_system_test_case"

class RandomQuotesTest < ApplicationSystemTestCase
  test "visiting the root" do
    visit root_url

    assert_rendered_quote
  end

  test "get random quote" do
    visit random_quote_url

    assert_rendered_quote
  end

  test "get random quote from a specific character" do
    visit random_character_quote_url(slug: "katy")

    assert_selector "h2.author", text: "Katy"
    assert_rendered_quote

    click_on "Random Katy Quote"

    assert has_link?("Random Katy Quote")
  end

  def assert_rendered_quote
    assert_selector "h1.quote"
    assert has_link?("Random Quote")
    assert(has_link?("Random Wayne Quote") || has_link?("Random Katy Quote"), "Missing random character quote button")
    assert_match(%r{/quotes/\d+}, current_path, "should redirect to quote_path")
  end
end
