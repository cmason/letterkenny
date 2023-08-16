# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  admin_at        :datetime
#  avatar_url      :string
#  datetime        :datetime
#  name            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  slack_team_id   :string           not null
#  slack_unique_id :string           not null
#  slack_user_id   :string           not null
#
# Indexes
#
#  index_users_on_admin_at         (admin_at)
#  index_users_on_slack_unique_id  (slack_unique_id) UNIQUE
#
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

  test "user should be admin if admin_at is present" do
    assert_not_predicate @user, :admin?
    @user.make_admin
    assert_predicate @user, :admin?
  end

  test "make_admin! should persist an admin" do
    @user.make_admin!
    assert_predicate @user, :admin?
    assert_predicate @user, :persisted?
  end

  test "revoke_admin! should revoke admin status" do
    @user.make_admin!
    @user.revoke_admin!
    assert_not_predicate @user, :admin?
    assert_predicate @user, :persisted?
  end

  test "admins should return only admins" do
    assert_equal [users(:admin)], User.admins
  end

  test "not_admins should return only non-admins" do
    assert_equal [users(:slack)], User.not_admins
  end
end
