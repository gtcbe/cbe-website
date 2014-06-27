class CommentsController < ApplicationController
	
	before_action :signed_in_user, only: [:create, :update, :destroy, :upvote, :downvote]
	before_action :correct_user, only: [ :update, :destroy ]
	
	def create

		@comment = current_user.comments.build(comment_params)
		if  @comment.save
			redirect_to :back
		else
			redirect_to blogposts_url
		end
	end
	
	def destroy
		@comment.destroy
		redirect_to root_url
	end
	
	def upvote
		@comment = Comment.find(params[:id])
		@comment.upvote_from current_user
		@comment.user.increase_karma
		redirect_to :back
	end
	
	def downvote
		@comment = Comment.find(params[:id])
		@comment.downvote_from current_user
		@comment.user.decrease_karma
		redirect_to :back
	end

	private
	
		def comment_params
			params.require(:comment).permit(:title, :text, :commentable_id, :commentable_type)
		end
	
		def correct_user
			@comment = current_user.comments.find_by(id: params[:id])
			redirect_to root_url if @comment.nil?
		end
end
