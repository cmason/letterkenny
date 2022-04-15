class CharacterResource < Avo::BaseResource
  self.title = :name
  self.description = "A character in the LetterKenny universe."
  self.includes = []
  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id, sortable: true, link_to_resource: true
  field :name, as: :text, required: true, sortable: true
  field :slug, as: :text, link_to_resource: true
  field :quotes, as: :has_many
  field :created_at, as: :date, readonly: true
  field :updated_at, as: :date, readonly: true
end
