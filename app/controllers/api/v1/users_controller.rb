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
    @user.save
    render json: @user, status: 201
  end

  def update
    @user.update(user_params)
    render json: @user, status: 202
    # -or-
    # if @user.save
    #   render json: @user, status: :accepted
    # else
    #   render json: {errors: @user.errors.full_messages}, status: :unprocessible_entity
    # end
  end

private
  def user_params
    params.require(:user).permit(:name)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
