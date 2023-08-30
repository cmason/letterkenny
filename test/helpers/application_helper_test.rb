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

  test "formats page specific title" do
    content_for(:title) { "Page Title" }
    assert_equal "Page Title | #{I18n.t("letterkenny")}", title
  end

  test "returns app name when page title is missing" do
    assert_equal I18n.t("letterkenny"), title
  end

  test "formats page specific open graph description" do
    content_for(:og_description) { "OG Description" }
    assert_equal "OG Description", og_description
  end

  test "returns tagline when og_description is missing" do
    assert_equal I18n.t("tagline"), og_description
  end
end
