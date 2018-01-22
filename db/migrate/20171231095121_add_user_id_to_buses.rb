class AddUserIdToBuses < ActiveRecord::Migration[5.1]
  def change
    add_column :buses, :user_id, :integer
  end
end
