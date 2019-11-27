class ProductsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
  end

  def show
    @products = current_user.products.paginate(page: params[:page])
  end


  private

  def set_products
  end
end