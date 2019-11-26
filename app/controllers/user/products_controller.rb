class User::ProductsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    @products = current_user.products.paginate(page: params[:page])
  end

  def new
    @product = current_user.products.build
  end

  def create
    @product = current_user.products.build(product_params)
    # byebug
    if @product.save
      # byebug
      flash[:success] = "投稿できました"
      redirect_to 'products/index'
    else
      # byebug
      render 'products/new'
    end
  end

  def show
    @products = current_user.products.paginate(page: params[:page])
  end

  def edit
  end

  def update
  end

  def destroy
    @product = current_user.products.find(params[:id])
    @product.destroy
    flash[:success] = "商品を削除しました"
    redirect_to user_products_path
  end

  private

  def set_products
  end

  def product_params
    params.require(:product).permit(:name, :details, :price, :condition, :status)
  end
end