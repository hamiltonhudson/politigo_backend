class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users, status: 200
  end

  def show
    find_user
    render json: @user, status: 200
  end

  def create
    @user = User.create(user_params)
    if @user.save
      render json: @user, status: 201
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :score, :events)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
