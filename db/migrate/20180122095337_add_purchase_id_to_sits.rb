class AddPurchaseIdToSits < ActiveRecord::Migration[5.1]
  def change
    add_column :sits, :purchase_id, :integer
  end
end
