class AddJourneyIdToPurchases < ActiveRecord::Migration[5.1]
  def change
    add_column :purchases, :journey_id, :integer
  end
end
