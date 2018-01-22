class AddSitIdToPurchases < ActiveRecord::Migration[5.1]
  def change
    add_column :purchases, :sit_id, :integer
  end
end
