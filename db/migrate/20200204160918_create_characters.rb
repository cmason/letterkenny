class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    enable_extension "citext"
    create_table :characters do |t|
      t.string :name, null: false
      t.citext :slug, null: false

      t.timestamps
    end
    add_index :characters, :slug, unique: true
  end
end
