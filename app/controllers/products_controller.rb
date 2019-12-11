# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]

  def index
    @products = Product.paginate(page: params[:page])
  end

  def show
    @product = Product.find(params[:id])
    @images = @product.product_images
  end

  private

  def set_products; end
end
