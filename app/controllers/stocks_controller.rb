class StocksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @stocks = Stock.where(is_active: true).order(:symbol)
  end

  def show
    @stock = Stock.find(params[:id])
  end
end