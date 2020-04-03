class Character < ApplicationRecord
  before_validation :slugify

  has_many :quotes
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: {case_sensitive: false}

  private

  def slugify
    self.slug = name.to_s.parameterize unless attribute_present?(:slug)
  end
end
