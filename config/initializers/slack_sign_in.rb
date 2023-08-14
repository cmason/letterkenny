Rails.application.configure do
  config.slack_sign_in.scopes = %w[identity.basic identity.avatar]
end
