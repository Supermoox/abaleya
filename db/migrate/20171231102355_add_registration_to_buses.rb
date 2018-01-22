class AddRegistrationToBuses < ActiveRecord::Migration[5.1]
  def change
    add_column :buses, :registration, :string
  end
end
