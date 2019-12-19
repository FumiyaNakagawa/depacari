class PayService < BaseService

  def initialize
  end

  # private
  
  def pay(order, email, source)
    # TODO: サービスに移動する あと
    # TODO: トランザクション張　イーナム　rails transaction rescue
    # TODO: デパカリポイントの流れ
    # TODO: お金の流れ入れる

    # システム使用料計算
    order.margin = (order.total_amont * 0.1).floor
    order.save
    # 購入者Dpoint計算(購入者がDpointを使用した時)

    if order.use_depacari_point > 0
      order_user = order.user
      order_user.depacari_point -= order.use_depacari_point
      order_user.save

      # depacari_pointテーブルに書き込み
      # status 1:購入, 2:販売, 3:換金
      order_user_depacari_point = DepacariPoint.new(user_id: order.user_id, order_id: order.id, point: order.use_depacari_point, status: 1)
      order_user_depacari_point.save
    end

    # 出品者Dpoint計算
    sold_user = order.sold_user
    sold_user.depacari_point += order.total_amont - order.margin
    sold_user.save
    # depacari_pointテーブルに書き込み
    # status 1:購入, 2:販売, 3:換金
    sold_user_depacari_point = DepacariPoint.new(user_id: sold_user.id, order_id: order.id, point: (order.total_amont - order.margin), status: 2)
    sold_user_depacari_point.save

    # お金の動きテーブルに書き込み
    if order.total_amont > order.use_depacari_point
      order_user_money = MonayTransacrion.new(user_id: order.user_id, order_id: order.id, money: (order.total_amont - order.use_depacari_point), status: 1)
      order_user_money.save

      # stripe
      @price = (order.total_amont - order.use_depacari_point)
      @order_product = order.product

      customer = Stripe::Customer.create(
        email: email,
        source: source
      )

      charge = Stripe::Charge.create(
        customer: customer.id,
        amount: @price,
        description: "商品ID: #{@order_product.id} 商品名: #{@order_product.name}",
        currency: 'jpy'
      )

      Rails.logger.debug charge.inspect

    end

    product = order.product
    product.status = 1
    product.save
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_user_order_path(@order_product.id)
  end

end