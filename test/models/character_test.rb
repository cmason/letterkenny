# == Schema Information
#
# Table name: characters
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  slug       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_characters_on_slug  (slug) UNIQUE
#
require "test_helper"

class CharacterTest < ActiveSupport::TestCase
  test "should not save character without a name" do
    character = Character.new
    assert_not character.save, "Saved character without a name"
  end

  test "slug is generated from the name if it doesn't exist" do
    character = Character.new name: "Foo Bar"
    assert_predicate character, :valid?
    assert_equal("foo-bar", character.slug, "Slug not generated from name")
  end

  test "slug is not generated if it already exists" do
    character = Character.new name: "Foo Bar", slug: "foo"
    assert_predicate character, :valid?
    assert_equal("foo", character.slug, "Slug was generated")
  end

  test "slugs must be unique" do
    katy = characters(:katy)
    assert_raises ActiveRecord::RecordInvalid do
      Character.create! name: katy.name, slug: katy.slug
    end
  end
end
