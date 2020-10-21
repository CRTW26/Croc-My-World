class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(post_params)
    #render 'posts/index'
  end


  private
    def post_params
      params.require(:user).permit(:email, :password, :name)
    end
end
