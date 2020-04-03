require "test_helper"

class CharacterTest < ActiveSupport::TestCase
  test "should not save character without a name" do
    character = Character.new
    assert_not character.save, "Saved character without a name"
  end

  test "slug is generated from the name if it doesn't exist" do
    character = Character.new name: "Foo Bar"
    assert character.valid?
    assert_equal character.slug, "foo-bar", "Slug not generated from name"
  end

  test "slug is not generated if it already exists" do
    character = Character.new name: "Foo Bar", slug: "foo"
    assert character.valid?
    assert_equal character.slug, "foo", "Slug was generated"
  end

  test "slugs must be unique" do
    katy = characters(:katy)
    assert_raises ActiveRecord::RecordInvalid do
      Character.create! name: katy.name, slug: katy.slug
    end
  end
end
