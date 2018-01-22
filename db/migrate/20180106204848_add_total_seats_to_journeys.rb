class AddTotalSeatsToJourneys < ActiveRecord::Migration[5.1]
  def change
    add_column :journeys, :total_seats, :integer
  end
end
