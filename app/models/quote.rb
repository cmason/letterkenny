class Quote < ApplicationRecord
  belongs_to :character
  delegate :name, :slug, to: :character, prefix: :author
  validates :text, presence: true

  def self.random(character = nil)
    slug = character.is_a?(Character) ? character.slug : character.to_s
    character = Character.find_by(slug: slug)
    scope = character&.quotes || all
    scope.includes(:character).limit(1).order("Random()").first
  end
end
