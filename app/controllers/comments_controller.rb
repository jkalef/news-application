class CommentsController < ApplicationController

#---BEFORE ACTIONS--------------------------------------------
#from DEVISE
before_action :authenticate_user!


#---ACTIONS-----------------------------------------------------
	def create
		@post			= Post.find(params[:post_id])
		@comment    	= current_user.comments.new(comment_params)
		#this associates the comment to the specific post_id
		@comment.post 	= @post

		respond_to do |format|
				if @comment.save
					#email post creater if the comment was saved
					CommentsMailer.notify_post_owner(@comment).deliver_later
					format.html { redirect_to post_path(@post) }
					format.js	  { render :create_success }
				else
					format.html { render "posts/show" }
					format.js   { render :create_failure }
				end
		end
	end

	def edit
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post), notice: "record deleted"
	end


#--CLASS METHODS---------------------------------------------------
	private

	def comment_params
		#strong params
		comment_params = params.require(:comment).permit(:body)
	end


end
