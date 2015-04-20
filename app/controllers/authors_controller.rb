class AuthorsController < ApplicationController

  #show all posts created by this user
  def show
    @author = User.find(params[:user_id])
    @posts  = @author.posts

    #--FOR THE NAV MENU------------------------
    #potentially can be refactored into application controller
    @tags           = Tag.all
    @users          = User.all
    @featured_posts = Post.featured_posts
  end

end
