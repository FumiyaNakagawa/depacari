class CreateMoney < ActiveRecord::Migration[6.0]
  def change
    create_table :money do |t|
      t.integer :user_id
      t.integer :order_id
      t.integer :money
      t.string :status

      t.timestamps
    end
  end
end
