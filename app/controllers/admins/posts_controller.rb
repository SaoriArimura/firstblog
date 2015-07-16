class Admins::PostsController < ApplicationController
  before_action :authenticate_admin!
 # before_action :no_layout_action
  def index
    @posts = Post.all
    render :layout => nil
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to  admins_posts_path
  end

 # def no_layout_action
  #  render layout: false
 # end

end
