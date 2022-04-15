class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :slack_unique_id, null: false
      t.string :slack_user_id, null: false
      t.string :slack_team_id, null: false
      t.string :avatar_url

      t.timestamps
    end
    add_index :users, :slack_unique_id, unique: true
  end
end
