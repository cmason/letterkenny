class ApplicationController < ActionController::Base
  def default_url_options
    {host: ENV.fetch("DOMAIN", "localhost:5000")}
  end
end
