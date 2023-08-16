require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  test "should generate alert flash messages" do
    message = "This is an alert!"
    assert_dom_equal(
      %(<div class="flash__message notification is-light is-danger" data-controller="removals" data-action="animationend->removals#remove">#{message}</div>),
      flash_message(:alert, message)
    )
  end

  test "should generate notice flash messages" do
    message = "This is an notice!"
    assert_dom_equal(
      %(<div class="flash__message notification is-light is-primary" data-controller="removals" data-action="animationend->removals#remove">#{message}</div>),
      flash_message(:notice, message)
    )
  end

  test "unknown flash messages should default to notice" do
    message = "Wat is this?"
    assert_dom_equal(
      %(<div class="flash__message notification is-light is-primary" data-controller="removals" data-action="animationend->removals#remove">#{message}</div>),
      flash_message(:wat, message)
    )
  end
end
