# frozen_string_literal: true

class User::OrdersController < ApplicationController
  before_action :set_product, only: %i[new confirm create show]

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    # depacariポイントが入力されなかった場合0pointにする
    @order.use_depacari_point = @order.use_depacari_point.to_i
    @payment_amont = (@product.price - @order.use_depacari_point)

    # 支払い方法を選択していなかったら
    render new_user_product_orders_path if @order.valid?
  end

  def create
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
                         total_amont: @product.price, # 現在はproduct_priceと同じ金額
                         status: 0
                       ))

    if @order.valid?

      pay_service = PayService.new
      pay_service.pay(@order, params[:stripeEmail], params[:stripeToken])
      redirect_to user_product_orders_path
    else
      @images = @product.product_images
      # logger.info @order.errors.inspect
      redirect_to new_user_product_orders_path
    end
  end

  def show
    @order = Order.find_by(product_id: @product.id)
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :use_depacari_point, :product_id)
  end

  def set_product
    @product = Product.find(params[:product_id])
    @images = @product.product_images
  end
end
