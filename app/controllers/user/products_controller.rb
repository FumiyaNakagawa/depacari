# frozen_string_literal: true

class User::ProductsController < ApplicationController
  before_action :logged_in_user

  def index
    @products = current_user.products.paginate(page: params[:page])
  end

  def new
    @product = current_user.products.build
    # 10.times {@product.product_images.build}
    10.times do |i|
      @product.product_images.build(order_number: i)
    end
  end

  def create
    @product = current_user.products.build(product_params.merge(status: :waiting))
    if @product.save
      flash[:success] = '投稿できました'
      redirect_to user_products_path
    else
      render new_user_product_path
    end
  end

  def show
    @products = current_user.products.paginate(page: params[:page])
  end

  def edit
    @product = current_user.products.find(params[:id])
   end

  def update
    @product = current_user.products.find(params[:id])
    if @product.update_attributes(product_params)
      # flash[:success] = 'Profile updated'
      redirect_to @product
    else
      render edit_user_products_path
    end
  end

  def destroy
    @product = current_user.products.find(params[:id])
    @product.destroy
    flash[:success] = '商品を削除しました'
    redirect_to user_products_path
  end

  private

  def set_products; end

  def product_params
    params.require(:product).permit(:name, :details, :price, :condition, :status, product_images_attributes: %i[image order_number])
  end
end
