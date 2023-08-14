require "test_helper"

class CurrentTest < ActiveSupport::TestCase
  %i[user request_id session_id ip user_agent].each do |attribute_name|
    define_method("test_has_#{attribute_name}_attribute") do
      assert_respond_to(Current, attribute_name)
    end
  end
end
