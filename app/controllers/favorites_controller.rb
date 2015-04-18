class FavoritesController < ApplicationController

  def create
    @favorite = current_user.favorites.new
    @post = Post.find(params[:post_id])
    @favorite.post = @post

    respond_to do |format|
      if @favorite.save
        format.html { redirect_to root_path, notice: "favorited!" }
        format.js { render }
      else
        format.html { redirect_to root_path, alert: "didn't work out" }
        format.js { render }    
      end
    end
  end


  def destroy
    @favorite = current_user.favorites.find(params[:id])
    @post = @favorite.post
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Unfavorited!" }
      format.js { render }
    end
  end


  def index
    @favorites = current_user.favorite_posts.all
  end

end
