class CreateSits < ActiveRecord::Migration[5.1]
  def change
    create_table :sits do |t|
      t.string :number
      t.boolean :occupied
      t.references :bus, foreign_key: true

      t.timestamps
    end
  end
end
