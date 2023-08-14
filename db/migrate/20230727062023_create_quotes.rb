class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.text :text, null: false
      t.references :character, null: false, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
