class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.text :slug, null: false, collation: "nocase"

      t.timestamps
    end
    add_index :characters, :slug, unique: true
  end
end
