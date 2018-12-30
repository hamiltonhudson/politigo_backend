class Api::V1::UsersController < ApplicationController
  # before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: 200
  end

  # GET /users/1
  def show
    find_user
    render json: @user, status: 200
  end

  # POST /users
  def create
    @user = User.create(user_params)
    @user.save
    render json: @user, status: 201
    # ---or---
    #   @user = User.new(user_params)
    #   if @user.save
    #     render json: @user, status: :created, location: @user
    #   else
    #     render json: @user.errors, status: :unprocessable_entity
    #   end
  end

  # PATCH/PUT /users/1
  def update
    @user.update(user_params)
    render json: @user, status: 202
    # ---or---
    # if @user.save
    #   render json: @user, status: :accepted
    # else
    #   render json: {errors: @user.errors.full_messages}, status: :unprocessible_entity
    # end
    # ---or---
    # if @user.update(user_params)
    #   render json: @user
    # else
    #   render json: @user.errors, status: :unprocessable_entity
    # end
  end

    # DELETE /users/1
    # def destroy
    #   @user.destroy
    # end

private
  def user_params
    params.require(:user).permit(:name)
  end
  # ---or---
  # Use callbacks to share common setup or constraints between actions.
  # def set_user
  #   @user = User.find(params[:id])
  # end

  def find_user
    @user = User.find(params[:id])
  end
  # ---or---
  # Only allow a trusted parameter "white list" through.
  # def user_params
  #   params.require(:user).permit(:name)
  # end
end
