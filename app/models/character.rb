# == Schema Information
#
# Table name: characters
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  slug       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_characters_on_slug  (slug) UNIQUE
#
class Character < ApplicationRecord
  before_validation :slugify

  has_many :quotes, dependent: :destroy
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: {case_sensitive: false}

  private

  def slugify
    self.slug = name.to_s.parameterize unless attribute_present?(:slug)
  end
end
