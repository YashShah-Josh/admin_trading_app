class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
    render json: @orders
  end

  def create
    stock = Stock.find_by(symbol: order_params[:stock_symbol].upcase)
    return render json: { error: "Stock not found" }, status: :not_found unless stock

    order = current_user.orders.build(
      stock_id: stock.id,
      order_type: order_params[:order_type],
      price: order_params[:price],
      quantity: order_params[:quantity],
    )

    if order.save
      render json: { message: "Order placed successfully" }, status: :created
    else
      render json: { errors: order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    order = current_user.orders.find(params[:id])
    if order.pending?
      order.destroy
      render json: { message: "Order canceled" }, status: :ok
    else
      render json: { error: "Cannot cancel processed orders" }, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:stock_symbol, :order_type, :price, :quantity)
  end
end
