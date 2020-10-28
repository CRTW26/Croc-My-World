class FriendshipsController < ApplicationController

  def index
    @users = User.all
  end 

  def new
    @friendship = Friendship.new
    @friend = User.find(params[:friend_id])
  end

  def show
  end

  def create
      @friendship = Friendship.create(friend_params) 
        flash[:success] = "Friend request sent!"
        redirect_to friendships_url
  end 

  # def edit
  #   @friend = User.find(params[:friend_id]) 
  # end 

  def update
    @friend = User.find(params[:friend_id])  
    current_user.confirm(@friend)
    redirect_to friendships_url
  end 

 private

  def friend_params
    params.require(:friendship).permit(:friend_id).merge(user_id: current_user.id)
  end

end
