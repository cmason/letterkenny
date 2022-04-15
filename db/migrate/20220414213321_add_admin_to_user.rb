class AddAdminToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin_at, :datetime, default: nil, allow_nil: true
  end
end
