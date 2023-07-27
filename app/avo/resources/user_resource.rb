class UserResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  field :avatar_url, name: "Avatar", as: :external_image, radius: "9999"
  field :name, as: :text, required: true, sortable: true
  field :slack_user_id, as: :text
  field :slack_team_id, as: :text
  field :admin, as: :boolean, name: "Admin?" do |model| model.admin? end
  field :created_at, as: :date, readonly: true
  field :updated_at, as: :date, readonly: true

  action ToggleAdmin
end
