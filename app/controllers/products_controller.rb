class ProductsController < ApplicationController

  def index
    @products = Product.search(params[:query]).
                  filter(params[:filter]).all
    render json: @products
  end

end
