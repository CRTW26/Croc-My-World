class UsersController < ApplicationController
  
  def index
    @users = User.all
  end 

  def new
    @user = User.new
  end

  def create
    @user = User.create(post_params)
    redirect_to users_path
  end


  private
    def post_params
      params.require(:user).permit(:email, :password, :name)
    end
end
