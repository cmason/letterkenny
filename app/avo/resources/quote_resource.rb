class QuoteResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id, sortable: true, link_to_resource: true
  field :text, name: "Quote", as: :textarea, rows: 3, required: true
  field "Quote", as: :text, hide_on: :show do |model, resource, view|
    model.text.truncate 72
  end
  field :character, as: :belongs_to, required: true, link_to_resource: true
end
