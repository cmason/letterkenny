require "test_helper"

class UsersHelperTest < ActionView::TestCase
  test "should return the user's avatar" do
    user = users(:slack)

    assert_dom_equal(
      %(<figure class="image is-32x32"><img class="is-rounded" src="#{user.avatar_url}" width="32" height="32" /></figure>),
      avatar(user)
    )
  end
end
