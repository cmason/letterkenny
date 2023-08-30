module QuotesHelpers
  def assert_quote_rendered
    assert_selector "h1.quote"
    assert has_link?("Random Quote")
    assert(has_link?("Wayne Quote") || has_link?("Katy Quote"), "Missing random character quote button")
    assert has_link?("Permalink")
  end
end
