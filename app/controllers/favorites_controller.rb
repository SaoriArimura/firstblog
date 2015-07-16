class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @favorite = @current_user.favorites.build(post_id: @post.id)
    if @favorite.save
      redirect_to(:back)
    else
      redirect_to(:back)
    end
  end

  def destroy
    @favorite = @current_user.favorites.find_by!(params[:id])
    @favorite.destroy
    redirect_to(:back)
   end

end
