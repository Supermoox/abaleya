class CreateFroms < ActiveRecord::Migration[5.1]
  def change
    create_table :froms do |t|
      t.string :name

      t.timestamps
    end
  end
end
