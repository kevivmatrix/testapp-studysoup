class ProductsController < ApplicationController

  def index
    @products = Product.all
    @products = @products.search(params[:query]) if params[:query].present?
    @products = @products.filter(params[:filter]) if params[:filter].present?
    render json: @products
  end

end
