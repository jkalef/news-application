class FavoritesController < ApplicationController

      def create
            @favorite = current_user.favorites.new
            @post = Post.find(params[:post_id])
            @favorite.post = @post

            if @favorite.save
                  redirect_to root_path, notice: "favorited!"
            else
                  redirect_to root_path, alert: "didn't work out"    
            end
      end


      def destroy
            @favorite = current_user.favorites.find(params[:id])
            @favorite.destroy
            redirect_to root_path, notice: "Unfavorited!"
      end


      def index
            @favorites = current_user.favorite_posts.all
      end

end
