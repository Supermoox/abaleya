class AddMakeToBuses < ActiveRecord::Migration[5.1]
  def change
    add_column :buses, :make, :string
  end
end
