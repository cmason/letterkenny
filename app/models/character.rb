class Character < ApplicationRecord
  before_validation :slugify

  has_many :quotes, dependent: :destroy
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: {case_sensitive: false}

  def to_param
    slug
  end

  private

  def slugify
    self.slug = name.to_s.parameterize unless attribute_present?(:slug)
  end
end
