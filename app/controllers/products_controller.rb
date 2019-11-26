class ProductsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
  end

  def new
    @product = current_user.products.build
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      flash[:success] = "投稿できました"
      redirect_to 'products/index'
    else
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

  private

  def set_products
  end

  def product_params
    params.require(:product).permit(:name, :details, :price, :condition, :status)
  end
end