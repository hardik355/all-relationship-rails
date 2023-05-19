class UsersController < ApplicationController
  before_action :fetch_user, only: [:edit, :show, :update, :destroy]

  # Before Action Find User
  def fetch_user
    @user = User.find_by(id: params[:id])
  end 

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @user.build_pan_card
  end 

  def create 
    @user = User.new(user_params)
    @user.save
  end
  
  def edit; end 

  def show; end

  def update
    @user.update(user_params)
  end 
  
  def destroy
    @user.destroy
  end 

  private
  def user_params
    params.require(:user).permit(:f_name, :l_name, :email, :country, :password,
    pan_card_attributes: [:id, :pan_number])
  end 
  
end
