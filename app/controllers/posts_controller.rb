class PostsController < ApplicationController

#--BEFORE ACTIONS--------------------------------------------------
#from DEVISE
before_action :authenticate_user!, except: [:index, :show]

#this will allow my to use the method find_post in the listed actions
before_action :find_post, only: [:show, :edit, :update, :destroy]


#--ACTIONS----------------------------------------------------------

	# GET
	# URL /posts
	def index
		if params[:search_word]
			@posts = Post.search(params[:search_word])
		else
		#want to list all of the posts by ascending order
		#.latest is a method from my post model
			@posts = Post.latest
		end
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
		#need to get the current users information to show who made the post
		@post = current_user.posts.new(post_params)

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
		#use this to display all of the comments, sorted by most recent
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


	#action to view posts belonging to a specific user
	def your_posts
		#@user = User.find(params[:id])
		@posts = current_user.posts.all
	end


	#--CLASS METHODS---------------------------------------------------------
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










