class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
    render json: @users
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: { message: "User deleted successfully" }, status: :ok
  end
end

class Admin::StocksController < ApplicationController
  before_action :authenticate_admin!

  def create
    stock = Stock.new(stock_params)
    if stock.save
      render json: { message: "Stock added successfully" }, status: :created
    else
      render json: { errors: stock.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    stock = Stock.find(params[:id])
    if stock.update(stock_params)
      render json: { message: "Stock updated successfully" }, status: :ok
    else
      render json: { errors: stock.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def stock_params
    params.require(:stock).permit(:symbol, :company_name, :current_price, :price_change, :is_active)
  end
end
