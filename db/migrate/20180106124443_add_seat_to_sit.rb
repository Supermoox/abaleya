class AddSeatToSit < ActiveRecord::Migration[5.1]
  def change
    add_column :sits, :seat, :integer
  end
end
