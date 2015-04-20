class AuthorsController < ApplicationController

  def show
    @author = User.find(params[:user_id])
    @posts = @author.posts

    #--FOR THE NAV MENU------------------------
    @tags = Tag.all
    @users = User.all
    @featured_posts = Post.featured_posts
  end

end
