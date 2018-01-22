class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.integer :from_id
      t.integer :stop_id

      t.timestamps
    end
  end
end
