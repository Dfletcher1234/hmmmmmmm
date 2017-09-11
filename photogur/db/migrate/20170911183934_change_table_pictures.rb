class ChangeTablePictures < ActiveRecord::Migration[5.0]
  def change
    change_table :pictures do |t|
      t.integer :user_id
    end
  end
end
