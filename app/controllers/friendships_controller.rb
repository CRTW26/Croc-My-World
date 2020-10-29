class FriendshipsController < ApplicationController
  before_action :find_friend, only: [:new, :update] 

  def index
    @users = User.all
  end 

  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = Friendship.create(friend_params) 
    flash[:notice] = "Friend request sent!"
    redirect_to friendships_url
  end 

  def show 
  end

  def update
    current_user.confirm(@friend) ## if
      redirect_to friendships_url
      flash[:notice] = "Friend request accepted!"
    # else
    #   render 'new'
    # end
  end 

  def destroy
    @friendship = Friendship.find_by user_id: params[:friend_id] , friend_id: current_user.id
    @friendship.destroy
    redirect_to friendships_path 
    flash[:notice] = "Friend request denied!"
  end

 private

  def friend_params
    params.require(:friendship).permit(:friend_id).merge(user_id: current_user.id)
  end

  def find_friend
    @friend = User.find(params[:friend_id])
  end

end
