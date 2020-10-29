class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id]) or render_not_found
  end
  
end
