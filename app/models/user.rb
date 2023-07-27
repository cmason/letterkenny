class User < ApplicationRecord
  validates :name, presence: true
  validates :slack_unique_id, presence: true, uniqueness: true
  validates :slack_user_id, presence: true
  validates :slack_team_id, presence: true

  scope :admins, -> { where.not(admin_at: nil) }
  scope :not_admins, -> { where(admin_at: nil) }

  def admin
    admin_at.present?
  end
  alias_method :admin?, :admin

  def admin=(value)
    if value
      self.admin_at = Time.current if admin_at.blank?
    else
      self.admin_at = nil
    end
  end

  def make_admin
    self.admin = true
  end

  def revoke_admin
    self.admin = false
  end

  def make_admin!
    make_admin
    save!
  end

  def revoke_admin!
    revoke_admin
    save!
  end
end
