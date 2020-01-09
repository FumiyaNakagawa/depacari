class User::TransactionsController < ApplicationController
  before_action :set_product
  
  def new
    @evaluation = Evaluation.new
  end

  def create
    evaluation_service = EvaluationService.new
    if current_user.id == @order.user_id # もし購入者だったら
      # 出品者を評価して状態を購入者評価済みにする
      evaluation_service.evaluation_bought_user!(evaluation_params, current_user, @order)

    elsif current_user.id == @product.user_id # もし出品者だったら
      # 購入者を評価して
      evaluation_service.evaluation_sold_user!(evaluation_params, current_user, @order)

    end

    redirect_to new_user_product_transaction_path
  end

  def edit
  end

  def transaction
    # orderのstatusがreceivedの時出品者と購入者が評価ページにリダイレクトする

    # @order.status.received?
    if @order.status == 'received' || @order.status == 'bought_user_evaluated'
      redirect_to new_user_product_transaction_path
      return
    end

  end

  def update
    if @order.update_attributes(update_transaction_params)
      redirect_to transaction_user_product_transaction_path
    else
      render transaction_user_product_transaction_path
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])


    @order = Order.find_by(product_id: @product.id, user_id: current_user.id)
    unless @order
      @order = Order.find_by(product_id: @product.id, sold_user_id: current_user.id)
    end

    unless @order
      render :bad_request
      return
    end
  end

  def update_transaction_params
    params.require(:order).permit(:status)
  end

  def evaluation_params
    params.require(:evaluation).permit(:evaluation, :comment)
  end
end
