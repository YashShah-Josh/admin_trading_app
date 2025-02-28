class StocksController < ApplicationController
  def index
    @stocks = Stock.all
    render json: @stocks
  end

  def show
    @stock = Stock.find_by(symbol: params[:id].upcase)
    if @stock
      render json: @stock
    else
      render json: { error: "Stock not found" }, status: :not_found
    end
  end
end
