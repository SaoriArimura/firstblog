class Admins::PostsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @posts = Post.all
    render :layout => nil
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to  admins_posts_path
  end

end
