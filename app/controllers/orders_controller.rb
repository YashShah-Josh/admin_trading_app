class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      redirect_to orders_path, notice: 'Order placed successfully!'
    else
      render :new
    end
  end

  def destroy
    @order = current_user.orders.find(params[:id])
    @order.destroy
    redirect_to orders_path, alert: 'Order cancelled.'
  end

  private

  def order_params
    params.require(:order).permit(:stock_id, :order_type, :price, :quantity, :status)
  end
end
