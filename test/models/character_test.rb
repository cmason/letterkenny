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

  class CharacterToParamTest < ActiveSupport::TestCase
    def setup
      @character = characters(:katy)
    end

    def teardown
      Character.toggle_override_to_param(true)
    end
    test "to_param returns the slug if override_to_param_enabled?" do
      Character.toggle_override_to_param(true)
      assert_equal(@character.slug, @character.to_param)
    end

    test "to_param returns the id unless override_to_param_enabled?" do
      Character.toggle_override_to_param(false)
      assert_equal(@character.id.to_s, @character.to_param)
    end

    test "to_param returns nil if the character is not persisted" do
      assert_nil(Character.new.to_param)
    end

    test "override_to_param_enabled? is enabled by default" do
      assert_predicate Character, :override_to_param_enabled?
    end
  end
end
