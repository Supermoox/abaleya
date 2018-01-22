class AddSeatIdToPurchases < ActiveRecord::Migration[5.1]
  def change
    add_column :purchases, :seat_id, :integer
  end
end
