class Current < ActiveSupport::CurrentAttributes
  attribute :user, :request_id, :session_id, :ip, :user_agent
end
