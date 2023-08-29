class SessionCookieGenerator
  extend Forwardable
  def_delegators :session_hash, :[], :[]=

  attr_reader :session_hash, :session_key

  def initialize
    @session_key = Rails.configuration.session_options[:key]
    @session_hash = {"session_id" => SecureRandom.hex(32)}
    @cookie_jar = ActionDispatch::Cookies::CookieJar.new(Rails.configuration.secret_key_base) # , Capybara.default_host)
  end

  def to_s
    "#{session_key}=#{signed_session_value};"
  end

  def signed_session_value
    @cookie_jar.signed[session_key] = {value: session_hash.to_hash}
    Rack::Utils.escape(@cookie_jar[session_key])
  end
end
