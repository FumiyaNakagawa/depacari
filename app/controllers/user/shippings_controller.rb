class User::ShippingsController < ApplicationController
  before_action :set_product, only: %i[edit update]

  def edit
  end

  def update
    if @order.update_attributes(update_shipping_params)
      redirect_to edit_user_product_shipping_path
    else
      render edit_user_product_shipping_path
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
    @order = Order.find_by(product_id: @product.id)
  end

  def update_shipping_params
    params.require(:order).permit(:status)
  end
end
