# frozen_string_literal: true

class RenameProductCteatedAtcolumnToOrders < ActiveRecord::Migration[6.0]
  def change
    rename_column :orders, :product_cteated_at, :product_created_at
  end
end
