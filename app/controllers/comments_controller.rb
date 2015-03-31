class CommentsController < ApplicationController

	before_action :find_comment, only: [:show, :edit, :update, :destroy]

	def index
		#display the comments sorted by most recent
		#use the method from my comments model
		@comments = Comment.most_recent_comments
	end

	
	def new
		#instantiate a new variable to use in the form
		@comment = Comment.new
	end


	def create
		#pass the parametres from the form into a variable
		#@comment using strong params
		@comment = Comment.new(comment_params)

		if @comment.save
			#ultimately, this will redirect to the post page 
			#where we put the comment, but for now this works
			#for testing purposes
			redirect_to comment_path(@comment)
		else
			render :new
		end
	end


	def show
		#find the comment by it's id to render on the page
		#using the private method find_comment from before_action
	end


	def edit
		#find the comment by it's id
		#create an edit form in the view using my form partial
	end


	def update
		if @comment.update(comment_params)
			redirect_to comment_path(@comment)
		else
			render :edit
		end
	end


	def destroy
		@comment.destroy
		redirect_to comments_path
	end



	private

	def comment_params
		comment_params = params.require(:comment).permit(:body)
	end

	def find_comment
		@comment = Comment.find(params[:id])
	end



end
