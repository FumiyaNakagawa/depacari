class CreateDepacariPoints < ActiveRecord::Migration[6.0]
  def change
    create_table :depacari_points do |t|
      t.integer :user_id
      t.integer :order_id
      t.integer :point
      t.string :string

      t.timestamps
    end
  end
end
