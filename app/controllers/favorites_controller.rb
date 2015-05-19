class FavoritesController < ApplicationController

  #create a new favorite
  def create
    #gather all the variables needed for the action, and associate them together
    @favorite      = current_user.favorites.new
    @post          = Post.find(params[:post_id])
    @favorite.post = @post
    #use rails ajax
    respond_to do |format|
      if @favorite.save
        format.html { redirect_to root_path, notice: "favorited!" }
        format.js { render }
      else
        format.html { redirect_to root_path, alert: "didn't work out" }
        format.js { render }    
      end
    end
  #--end create action
  end


  def destroy
    #variables needed for the action
    @favorite = current_user.favorites.find(params[:id])
    @post     = @favorite.post
    @favorite.destroy
    #use rails ajax
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Unfavorited!" }
      format.js { render }
    end
  end


  def index
    #show all of your favorite posts
    @posts = current_user.favorite_posts

    #--FOR THE NAV MENU---------------------
    #potentially can be refactered into application controller
    @users          = User.all
    @tags           = Tag.all
    @featured_posts = Post.featured_posts
  end

end
