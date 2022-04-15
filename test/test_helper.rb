require "simplecov"
SimpleCov.start "rails" do
  add_filter "test/"
  add_filter "db/"
  add_filter "config/"
  add_filter "node_modules/"
  add_filter "bin/"
end

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "minitest/pride"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def assert_quote_rendered
    assert_selector "h1.quote"
    assert has_link?("Random Quote")
    assert(has_link?("Random Wayne Quote") || has_link?("Random Katy Quote"), "Missing random character quote button")
    assert_match(%r{/quotes/\d+}, current_path, "should redirect to quote_path")
  end
end
