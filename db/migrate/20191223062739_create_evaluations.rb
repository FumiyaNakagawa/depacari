class CreateEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluations do |t|
      t.integer :user_id, comment: '評価者'
      t.integer :order_id, comment: 'order_id'
      t.integer :user, comment: '出品者か購入者か'
      t.integer :evaluation, comment: '評価'
      t.integer :point, comment: '評価ポイント'
      t.text :comment, comment: '評価コメント'

      t.timestamps
    end
  end
end
