class AddBusIdToJourneys < ActiveRecord::Migration[5.1]
  def change
    add_column :journeys, :bus_id, :integer
  end
end
