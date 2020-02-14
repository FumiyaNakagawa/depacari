# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.integer :phone_number
      t.string :email
      t.string :name
      t.string :address
      t.integer :evaluation_point, default: 0

      t.timestamps
    end
  end
end
