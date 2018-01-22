class AddBusIdToSeats < ActiveRecord::Migration[5.1]
  def change
    add_column :seats, :bus_id, :integer
  end
end
