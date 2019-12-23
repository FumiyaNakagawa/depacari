# frozen_string_literal: true

class CreateMonayTransacrions < ActiveRecord::Migration[6.0]
  def change
    create_table :monay_transacrions do |t|
      t.integer :user_id
      t.integer :order_id
      t.integer :money
      t.integer :status

      t.timestamps
    end
  end
end
