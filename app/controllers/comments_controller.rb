class CommentsController < ApplicationController

#---BEFORE ACTIONS--------------------------------------------
#from DEVISE
before_action :authenticate_user!


#---ACTIONS-----------------------------------------------------


	def create
		@post			= Post.find(params[:post_id])
		@comment    	= Comment.new(comment_params)
		#this associates the comment to the specific post_id
		@comment.post 	= @post

		if @comment.save
			redirect_to post_path(@post)
		else
			render "posts/show"
		end
	end



#--CLASS METHODS---------------------------------------------------
	private

	def comment_params
		#strong params
		comment_params = params.require(:comment).permit(:body)
	end


end
