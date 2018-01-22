class CreateJourneys < ActiveRecord::Migration[5.1]
  def change
    create_table :journeys do |t|
      t.decimal :price
      t.datetime :departure
      t.datetime :arrival
      t.text :description
      t.references :from, foreign_key: true
      t.references :to, foreign_key: true

      t.timestamps
    end
  end
end
