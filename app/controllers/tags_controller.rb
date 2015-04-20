class TagsController < ApplicationController

  def show
     #display all of the posts with this tag/topic
     @tag   = Tag.find(params[:id])
     @posts = @tag.posts 

     #--FOR THE NAV MENUS
     #-refactor into application controller...
     @tags           = Tag.all
     @users          = User.all
     @featured_posts = Post.featured_posts
  end

end
