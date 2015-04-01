class PostsController < ApplicationController

#this will allow my to use the method find_post in the listed actions
before_action :find_post, only: [:show, :edit, :update, :destroy]

	# GET
	# URL /posts
	def index
		#want to list all of the posts by ascending order
		#.latest is a method from my post model
		@posts = Post.latest
	end

	# GET
	# URL /posts/new
	def new
		#need to instantiate a new Post for our post method to get to
		@post = Post.new
	end

	# POST
	# URL /posts
	def create
		#pass in the post params
		@post = Post.new(post_params)

		if @post.save
			redirect_to post_path(@post), notice: "post successfuly created"
		else
			render :new
		end
	end


	# GET
	# URL /posts/:id
	def show
		#instantiate a new comment
		@comment = Comment.new
		@comments = @post.comments.most_recent_comments 
	end


	# GET
	# URL /posts/edit/:id
	def edit
	end


	# PATCH
	# URL /posts/:id
	def update
		#if successful, render the show page
		if @post.update(post_params)
			redirect_to post_path(@post), notice: "post successfully updated!"
		else
			render :edit
		end
	end


	# DELETE
	# URL /posts/:id
	def destroy
		@post.destroy

		redirect_to posts_path, notice: "Post successfully deleted"
	end

	#some methods just for use in this controller
	private


	def post_params
		#strong params
		post_params = params.require(:post).permit(:title, :body)
	end

	def find_post
		#method to find a post by its id
		@post = Post.find(params[:id])
	end

end










