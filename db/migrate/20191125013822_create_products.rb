class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :user_id
      t.string :name
      t.text :details
      t.integer :price
      t.string :condition
      t.string :status

      t.timestamps
    end
  end
end
