class Quote < ApplicationRecord
  belongs_to :character
  delegate :name, :slug, to: :character, prefix: :author
  validates :text, presence: true

  def self.random(character = nil)
    scope = all
    scope = character.quotes if character
    scope.includes(:character).limit(1).order("Random()").first
  end
end
