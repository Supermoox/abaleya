class CreateBuses < ActiveRecord::Migration[5.1]
  def change
    create_table :buses do |t|
      t.references :transporter, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
