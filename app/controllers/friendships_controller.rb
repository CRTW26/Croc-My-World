class FriendshipsController < ApplicationController

  def index 
  end 

  def new 
    @friendship = Friendship.new
  end 

  def create
    @friendship = Friendship.create(friend_params)
      if @friendship.save 
      flash[:success] = "Friend added!"
      redirect_to friendships_url
    else 
      flash.now[:alert] = 'Awaiting response'
      render "new"
      # checking for pending friendship
    end
  end 

 private

  def friend_params
    params.require(:friendship).permit(:friend_id).merge(user_id: current_user.id)
  end

end
