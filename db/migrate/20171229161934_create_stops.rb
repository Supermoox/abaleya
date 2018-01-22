class CreateStops < ActiveRecord::Migration[5.1]
  def change
    create_table :stops do |t|
      t.decimal :price
      t.datetime :arrival
      t.references :city, foreign_key: true
      t.references :journey, foreign_key: true

      t.timestamps
    end
  end
end
