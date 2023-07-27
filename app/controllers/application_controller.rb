class ApplicationController < ActionController::Base
  before_action :set_current_user, if: :user_signed_in?
  protect_from_forgery with: :exception
  helper_method :current_user
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def default_url_options
    {host: ENV.fetch("DOMAIN", "localhost:3000")}
  end

  private

  def user_signed_in?
    session[:user_id].present?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if user_signed_in?
  end

  def set_current_user
    Current.user = current_user
  end

  def not_found
    respond_to do |format|
      format.html { render file: "public/404.html", layout: false, status: :not_found }
      format.json { render json: {error: "Not Found", status: 404} }
    end
  end
end
