class FavoritesController < ApplicationController
 # before_filter :require_login

  def create
    @post    = Post.find(params[:post_id])
    @favorite = current_user.favorites.build(post_id: @post.id)
    if @favorite.save
      redirect_to posts_url, notice: "お気に入りに登録しました"
    else
      redirect_to posts_url, alert: "このツイートはお気に入りに登録できません"
    end
  end

  def destroy
    @favorite = current_user.favorites.find_by!(params[:post_id],params[:id])
    @favorite.destroy
    redirect_to posts_url, notice: "お気に入りを解除しました"
  end

end
