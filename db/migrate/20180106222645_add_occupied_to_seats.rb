class AddOccupiedToSeats < ActiveRecord::Migration[5.1]
  def change
    add_column :seats, :occupied, :boolean
  end
end
