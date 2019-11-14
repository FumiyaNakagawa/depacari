class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password
      t.integer :phone_number
      t.string :mail
      t.string :name
      t.string :address
      t.integer :evaluation_point

      t.timestamps
    end
  end
end
