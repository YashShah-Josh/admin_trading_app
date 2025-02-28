class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    render json: @user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      render json: { message: "Profile updated successfully" }, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :phone, :address)
  end
end
