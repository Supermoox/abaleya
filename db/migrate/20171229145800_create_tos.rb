class CreateTos < ActiveRecord::Migration[5.1]
  def change
    create_table :tos do |t|
      t.string :name

      t.timestamps
    end
  end
end
