class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end 

  def create 
    @user = User.new(user_params)
    @user.save
  end
  
  def edit
    @user = User.find_by(id: params[:id]) 
  end 

  def update
    @user = User.find_by(id: params[:id].to_i)
    @user.update(user_params)
  end 
  
  def show
    @user = User.find_by(id: params[:id].to_i)
  end 


  private
  def user_params
    params.require(:user).permit(:f_name, :l_name, :email, :country, :password)
  end 
  
end
