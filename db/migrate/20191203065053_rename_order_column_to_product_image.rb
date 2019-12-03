class RenameOrderColumnToProductImage < ActiveRecord::Migration[6.0]
  def change
    rename_column :product_images, :order, :order_number
  end
end
