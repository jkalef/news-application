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
		# if params[:reading_id]
		# #for the reading list
		# 	@post = Post.find(params[:id])
		# 	@add_to_list = current_user.readings.find(params[:reading_id])
		# 	@post.add_to_list = @add_to_list
		# end

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
			redirect_to root_path, notice: "post successfully updated!"
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
		post_params = params.require(:post).permit(:title, :body, :reading_id, :picture)
	end

	def find_post
		#method to find a post by its id
		@post = Post.find(params[:id])
	end

end


#--RANDOM NOTES--------------------------------
#use this format to make an edit form on the same page,
#as opposed to having to change the page
# <div class="edit-form">--make hidden
# add the form_for









