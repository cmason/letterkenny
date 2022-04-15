class Avo::BaseResourcesController < Avo::ResourcesController
  around_action :disable_override_character_to_param

  private

  def disable_override_character_to_param
    Character.toggle_override_to_param(false)
    yield
    Character.toggle_override_to_param(true)
  end
end
