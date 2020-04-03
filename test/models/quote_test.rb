require "test_helper"

class QuoteTest < ActiveSupport::TestCase
  test "should not save quote without text" do
    quote = Quote.new
    assert_not quote.save, "Saved quote without text"
  end

  test "should return random quotes" do
    assert_includes quotes, Quote.random, "Quote not returned"
  end

  test "random quotes are limited to a specific character when passed a character" do
    katy = characters(:katy)
    assert_equal Quote.random(katy).character, katy, "Quote was from a different character"
  end

  test "the author of a quote is the character's name" do
    quote = Quote.random
    assert_equal quote.author, quote.character.name, "author is not the character name"
  end
end
