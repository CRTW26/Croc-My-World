class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(post_params)
  end


  private
    def post_params
      params.require(:user).permit(:name, :email, :password)
    end
end
