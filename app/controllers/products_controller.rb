class ProductsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
  end

  def new
    @product = current_user.products.build if logged_in_user?
  end

  def create
    @product = current_user.product.build(product_params)
    if @product.save
      flash[:success] = "投稿できました"
      redirect_to 'product/index'
    else
      render 'product/new'
    end
  end

  def show
    @products = @user.products.paginate(page: params[:page])
  end

  def edit
  end

  def update
  end

  private

  def set_products
  end

  def product_params
    params.require(:product).permit(:name, :details, :price, :condition, :status)
  end
end