class PostsController < ApplicationController

#--BEFORE ACTIONS--------------------------------------------------
#from DEVISE
before_action :authenticate_user!, except: [:index, :show]

#from the private methods below
before_action :find_post, only: [:edit, :update, :destroy]


#--ACTIONS----------------------------------------------------------

  def index
    #--Fun search methods---------
    #regular search, display normal results
    if params[:commit] == "Search"
          @posts = Post.search(params[:search_word]).latest
    #lucky search, display a random result
    elsif params[:commit] == "I'm Feeling Lucky"
          @post = Post.lucky_search(params[:search_word])
            #check if there actually are any matches, if not, pick
            #just a random post from the list to show
            if defined? @post.id
              redirect_to post_path(@post)
            else
              @post = Post.all.sample
              redirect_to post_path(@post), notice: "No results matched your search,
                                        but here's a random post anyways!"
            end
    else
    #default view of no search query is made..view the latest posts
    @posts = Post.latest
    #--end IF statement for search
    end

    #--FOR THE SEARCH MENUS---------------------------------------
    @tags = Tag.all
    @users = User.all
    @featured_posts = Post.featured_posts

  #-close index action
  end

  
  def new
    #need to instantiate a new Post for our post method to get to
    @post = Post.new
    @tag = Tag.new
  end

  # POST
  # URL /posts
  def create
    #pass in the post params
    #need to get the current users information to show who made the post
    @post = current_user.posts.new(post_params)
    
    @post.tags << split_the_tags

    if @post.save
      #InterestMailer.notify_interested_users(@post).deliver_later
      redirect_to post_path(@post), notice: "post successfuly created"
    else
      render :new
    end
  end


  # GET
  # URL /posts/:id
  def show
    #need to find the post to display
    #not included in before_action due to user permissions
    @post = Post.find(params[:id])
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
    post_params = params.require(:post).permit(:title, :body, :reading_id, :picture, :tag_string)
      
  end

  def find_post
    #method to find a post by its id
    @post = Post.find(params[:id])
    #if the user is not an admin, they can't access the edit, destroy or update actions
    redirect_to root_path alert: "access denied" unless can? :manage, @post
  end

  #split tags entered by the user by commas
  def split_the_tags
    tags = []
    split_tags = post_params[:tag_string].split(",")
    split_tags.each do |tag_name|
      tag = Tag.find_by_name_or_new(tag_name)
      tag.save
      tags << tag
    end
    tags
  end

end










