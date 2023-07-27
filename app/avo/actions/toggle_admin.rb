class ToggleAdmin < Avo::BaseAction
  self.name = "Toggle admin"

  def handle(**args)
    models, _fields, current_user, _resource = args.values_at(:models, :fields, :current_user, :resource)
    Rails.logger.debug args
    Rails.logger.info "toggle_admin: #{models.inspect}"
    Rails.logger.info "toggle_admin: #{current_user.inspect}"
    models.each do |model|
      status = if model.admin?
        model.revoke_admin!
        "revoked"
      else
        model.make_admin!
        "granted"
      end
      succeed "Admin status #{status} for #{model.name}"
    end
    reload
  end
end
