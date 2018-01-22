class AddCarrierNameToBuses < ActiveRecord::Migration[5.1]
  def change
    add_column :buses, :carrier_name, :string
  end
end
