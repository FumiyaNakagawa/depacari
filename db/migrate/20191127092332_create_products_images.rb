class CreateProductsImages < ActiveRecord::Migration[6.0]
  def change
    create_table :products_images do |t|
      t.integer :product_id
      t.string :product_image
      t.integer :order

      t.timestamps
    end
  end
end