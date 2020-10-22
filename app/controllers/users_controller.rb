class UsersController < ApplicationController

  
  def index
    @users = User.all
  end 

  def new
    @user = User.new
  end

  def create
    @user = User.create(post_params)
    redirect_to posts_path
  end

  def show
    current_user
  end
  


  private
    def post_params
      params.require(:user).permit(:email, :password, :name)
    end
end
