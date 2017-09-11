class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :has_secure_password, :string
  end
end
