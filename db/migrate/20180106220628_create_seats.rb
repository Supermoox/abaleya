class CreateSeats < ActiveRecord::Migration[5.1]
  def change
    create_table :seats do |t|
      t.integer :seat_number
      t.references :journey, foreign_key: true

      t.timestamps
    end
  end
end
