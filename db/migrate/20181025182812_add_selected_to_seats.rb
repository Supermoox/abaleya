class AddSelectedToSeats < ActiveRecord::Migration[5.1]
  def change
    add_column :seats, :selected, :boolean
  end
end
