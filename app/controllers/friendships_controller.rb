class FriendshipsController < ApplicationController
  before_action :find_friend, only: [:new, :update, :destroy] 

  def index
    @users = User.all
  end 

  def new
    @friendship = Friendship.new
  end

  def show
  end

  def create
    @friendship = Friendship.create(friend_params) 
    redirect_to friendships_url
    flash[:success] = "Friend request sent!"
  end 

  def update
    if current_user.confirm(@friend)
      redirect_to friendships_url
      flash[:success] = "Friend request accepted!"
    else
      render 'new'
    end
  end 

  def destroy
    if current_user.reject(@friend)
      redirect_to friendships_path 
      flash[:success] = "Friend request denied!"
    else
      render 'new'
    end
  end

 private

  def friend_params
    params.require(:friendship).permit(:friend_id).merge(user_id: current_user.id)
  end

  def find_friend
    @friend = User.find(params[:friend_id])
  end

end
