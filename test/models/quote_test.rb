# == Schema Information
#
# Table name: quotes
#
#  id           :integer          not null, primary key
#  text         :text             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  character_id :integer          not null
#
# Indexes
#
#  index_quotes_on_character_id  (character_id)
#
# Foreign Keys
#
#  character_id  (character_id => characters.id) ON DELETE => cascade
#
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

  test "random quotes are limited to a specific character when passed a character slug" do
    katy = characters(:katy)
    assert_equal Quote.random("katy").character, katy, "Quote was from a different character"
  end

  test "random quote is returned when not passed a character" do
    assert_not_nil Quote.random, "Random quote was not returned"
  end

  test "should delegate author_name to character" do
    quote = Quote.random
    assert_equal quote.author_name, quote.character.name, "author is not the character name"
  end

  test "should delegate author_slug to character" do
    quote = Quote.random
    assert_equal quote.author_slug, quote.character.slug, "author is not the character name"
  end
end
