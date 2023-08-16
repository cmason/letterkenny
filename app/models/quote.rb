# == Schema Information
#
# Table name: quotes
#
#  id           :integer          not null, primary key
#  text         :text             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  character_id :integer          not null
#
# Indexes
#
#  index_quotes_on_character_id  (character_id)
#
# Foreign Keys
#
#  character_id  (character_id => characters.id) ON DELETE => cascade
#
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
