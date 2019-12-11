# frozen_string_literal: true

class User::OrdersController < ApplicationController
  def index; end

  def new
    @product = Product.find(params[:product_id])
    @images = @product.product_images
    @order = Order.new
  end

  def create
    @product = Product.find(params[:order][:product_id])
    @order = Order.new(order_params.merge(
      product_id: @product.id,
      shipping_name: current_user.name,
      user_id: current_user.id,
      shipping_address: current_user.address,
      sold_user_id: @product.user_id,
      product_name: @product.name,
      product_price: @product.price,
      product_details: @product.details,
      product_condition: @product.condition,
      product_created_at: @product.created_at,
      product_updated_at: @product.updated_at,
      total_amont: @product.price, #現在はproduct_priceと同じ金額
      status: 0
      )
    )

    if @order.valid?
      pay(@order)
      redirect_to user_order_path(id: @order.id)
    else
      @images = @product.product_images
      # logger.info @order.errors.inspect
      render new_user_order_path
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :use_depacari_point)
  end

  def pay(order)
    # TODO: サービスに移動する あと
    # TODO: トランザクション張　イーナム
    # TODO: デパカリポイントの流れ
    # TODO: お金の流れ入れる

    # システム使用料計算
    order.margin = (order.total_amont * 0.1).floor
    order.save
    # 購入者Dpoint計算
    order_user = order.user
    order_user.depacari_point -= order.use_depacari_point
    order_user.save

    # 出品者Dpoint計算
    sold_user = order.sold_user
    sold_user.depacari_point = order.total_amont - order.margin
    sold_user.save

    # depacari_pointテーブルに書き込み
    # DepacariPoint.new()

    # お金の動きテーブルに書き込み

    product = order.product
    product.status = 1
    product.save
  end
end
