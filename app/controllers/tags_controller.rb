class TagsController < ApplicationController

  def show
     @tag = Tag.find(params[:id])
     @posts = @tag.posts 

     @tags = Tag.all
     @users = User.all
     @featured_posts = Post.featured_posts
  end

end
