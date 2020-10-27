class FriendshipsController < ApplicationController

  def index
    @users = User.all
  end 

  def new
    @friendship = Friendship.new
  end

  def show
  end

  def create
    # if friendship_pending.friend.id == :friend_id
    #   'Friend already requested'
    # else
      @friendship = Friendship.create(friend_params)
        # if @friendship.save 
        flash[:success] = "Friend request sent!"
        redirect_to friendships_url
    
  end 

 private

  def friend_params
    params.require(:friendship).permit(:friend_id).merge(user_id: current_user.id)
  end

end
