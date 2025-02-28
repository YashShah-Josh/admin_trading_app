class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = current_user.transactions.order(executed_at: :desc)
    render json: @transactions
  end
end
