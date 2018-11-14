class AddTransporterToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :transporter, :boolean
  end
end
