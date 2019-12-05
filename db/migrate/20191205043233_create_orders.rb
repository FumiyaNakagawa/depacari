class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :user_id, comment: "買った人のid"
      t.integer :product_id, comment: "productのid"
      t.string :shipping_name, comment: "お届け先氏名"
      t.string :shipping_address, comment: "お届け先住所"
      t.string :payment_method, comment: "決済方法"
      t.integer :sold_user_id, comment: "売った人のid"
      t.string :product_name, comment: "製品名"
      t.integer :product_price, comment: "製品の値段"
      t.text :product_details, comment: "製品の詳細"
      t.string :product_condition, comment: "製品の状態"
      t.datetime :product_cteated_at, comment: "製品登録日時"
      t.datetime :product_updated_at, comment: "製品更新日時"
      t.integer :tax, comment: "消費税"
      t.integer :use_depacari_point, comment: "使用したdepacaripoint"
      t.integer :total_amont, comment: "合計金額"
      t.string :status, comment: "注文状況ステータス"

      t.timestamps
    end
  end
end
