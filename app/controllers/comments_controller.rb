class CommentsController < ApplicationController

	#---BEFORE ACTIONS--------------------------------------------
	#from DEVISE
	before_action :authenticate_user!


	#---ACTIONS----------------------------------------------------
	def create
		#variables needed to create a new comment, and attached it
		#to the post and current_user
		@post						= Post.find(params[:post_id])
		@comment  			= current_user.comments.new(comment_params)
		@comment.post 	= @post
		#use rails ajax
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
		@post 	 = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		#use CanCanCAn to secure this action
		redirect_to root_path alert: "access denied" unless can? :manage, @comment
	end


	def update
		#retrieve the necessary variables for the action
		@post 	 = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		#use rails ajax
		respond_to do |format|
			if @comment.update(comment_params)
				format.html { redirect_to @post, notice: "answer updated!"}
				format.js { render :update_success }
			else
				format.html { render :edit }
				format.js { render :update_failure }
			end
		end
	end


	def destroy
		#retrieve the variables needed for the action
		@post 	 = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		#use CanCanCan to secure this action
		redirect_to root_path alert: "access denied" unless can? :manage, @comment
		@comment.destroy
		#use rails ajax		
		respond_to do |format|
			format.html { redirect_to post_path(@post), notice: "record deleted" }
			format.js { render }
		end
	end

	#--CLASS METHODS---------------------------------------------------
	private

	def comment_params
		#strong params
		comment_params = params.require(:comment).permit(:body)
	end

end
