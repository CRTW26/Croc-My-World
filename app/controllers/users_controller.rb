class UsersController < ApplicationController
  
  def index
    @users = User.all
  end 

  def new
    @user = User.new
  end

  def create
    @user = User.create(post_params)
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  private
    def post_params
      params.require(:user).permit(:email, :password, :name)
    end
end
