require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Joe User", slack_unique_id: "T1-U1", slack_user_id: "U1", slack_team_id: "T1")
  end

  test "user should be valid" do
    assert_predicate @user, :valid?
  end

  test "should not save a user without a name" do
    @user.name = nil
    assert_not @user.valid?
    assert_includes @user.errors[:name], "can't be blank"
  end

  test "should not save user without a slack_user_id" do
    @user.slack_user_id = nil
    assert_not @user.valid?
    assert_includes @user.errors[:slack_user_id], "can't be blank"
  end

  test "should not save a user without a slack_team_id" do
    @user.slack_team_id = nil
    assert_not @user.valid?
    assert_includes @user.errors[:slack_team_id], "can't be blank"
  end

  test "should not save a user without a slack_unique_id" do
    @user.slack_unique_id = ""
    assert_not @user.valid?
    assert_includes @user.errors[:slack_unique_id], "can't be blank"
  end

  test "slack_unique_id must be unique" do
    slack_user = users(:slack)
    @user.slack_unique_id = slack_user.slack_unique_id
    assert_not @user.valid?
    assert_includes @user.errors[:slack_unique_id], "has already been taken"
  end
end
