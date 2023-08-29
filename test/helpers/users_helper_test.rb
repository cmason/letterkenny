require "test_helper"

class UsersHelperTest < ActionView::TestCase
  test "should return the user's avatar" do
    user = users(:slack)

    assert_dom_equal(
      %(<figure class="image is-32x32"><img class="is-rounded" alt="#{user.name}" src="#{user.avatar_url}" width="32" height="32" /></figure>),
      avatar(user)
    )
  end

  test "should return a default avatar for users without an avatar" do
    user = users(:slack)
    user.avatar_url = nil

    assert_dom_equal(
      %(<figure class="image is-32x32"><span class="icon"><i class="fas fa-user-secret is-size-3"></i></span></figure>),
      avatar(user)
    )
  end
end
