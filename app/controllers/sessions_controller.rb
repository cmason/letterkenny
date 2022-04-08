class SessionsController < ApplicationController
  include SlackSignIn::Authorization

  def create
    if slack_authorization.successful?
      user = find_or_create_user(slack_authorization.identity)
      create_session_for_user(user)
      flash[:notice] = "Signed in!"
    else
      flash[:alert] = slack_authorization.error
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out!"
  end

  private

  def find_or_create_user(identity)
    User.find_or_create_by!(slack_unique_id: identity.unique_id) do |user|
      user.name = identity.name
      user.slack_user_id = identity.user_id
      user.slack_team_id = identity.team_id
      user.avatar_url = identity.avatar(size: 32)
    end
  end

  def create_session_for_user(user)
    session[:user_id] = user.id
  end
end
