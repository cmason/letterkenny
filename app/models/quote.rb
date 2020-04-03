class Quote < ApplicationRecord
  belongs_to :character

  validates :text, presence: true

  def self.random(character = nil)
    (character&.quotes || all).includes(:character).limit(1).order("Random()").first
  end

  def author
    character.name
  end
end
