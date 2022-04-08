class User < ApplicationRecord
  validates :name, presence: true
  validates :slack_unique_id, presence: true, uniqueness: true
  validates :slack_user_id, presence: true
  validates :slack_team_id, presence: true
end
