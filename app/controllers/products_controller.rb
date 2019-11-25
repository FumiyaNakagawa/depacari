class ProductsController < ApplicationController
  def index
  end

  def new
  end

  def create
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
  end
end