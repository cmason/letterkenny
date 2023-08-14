class CreateUsers < ActiveRecord::Migration[7.0]
  create_table :users do |t|
    t.string :name, null: false
    t.string :slack_unique_id, null: false, collation: "nocase"
    t.string :slack_user_id, null: false
    t.string :slack_team_id, null: false
    t.string :avatar_url
    t.datetime :admin_at, :datetime, default: nil, allow_nil: true
    t.timestamps
  end
  add_index :users, :slack_unique_id, unique: true
  add_index :users, :admin_at
end
