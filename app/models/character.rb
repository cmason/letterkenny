class Character < ApplicationRecord
  class << self
    def override_to_param_enabled?
      true
    end

    def toggle_override_to_param(enabled)
      singleton_class.instance_eval do
        define_method(:override_to_param_enabled?) { enabled }
      end
    end
  end

  before_validation :slugify

  has_many :quotes, dependent: :destroy
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: {case_sensitive: false}

  def to_param
    return super unless self.class.override_to_param_enabled?
    return nil unless persisted?
    slug
  end

  private

  def slugify
    self.slug = name.to_s.parameterize unless attribute_present?(:slug)
  end
end
