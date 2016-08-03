class UsersController < ApplicationController

  before_action :set_user!, except: [:create, :index, :new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.admin = true if params[:user][:admin] == "1"
    if @user.save!
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def show
    
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password)
  end

  def set_user!
    @user = User.find(params[:id])
  end

end

