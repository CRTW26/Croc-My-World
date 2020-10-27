class LikesController < ApplicationController
	before_action :authenticate_user!
	before_action :find_post
	before_action :find_like, only: [:destroy]

	
	def create
		if !(already_liked?)
		  	@like = Like.create(post_id: params[:post_id], user_id: current_user.id)
		  	flash[:notice] = "You have liked this post"
		else
		 	 @like = Like.find_by(user_id: current_user.id)
		  	@like.destroy
		  	flash[:notice] = "You have unliked this post"
		end
			redirect_to root_url
	  end

	private
	
		def find_like
  		@like = @post.likes.find(params[:id])
		end

  	def find_post
    	@post = Post.find(params[:post_id])
  	end

		def already_liked?
  		Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
	end
end
