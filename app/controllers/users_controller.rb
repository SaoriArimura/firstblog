class UsersController < ApplicationController
before_action :set_user, except: [:index] 
before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @posts = @user.posts
  end

  def posts
    userposts = @user.posts
    @posts = userposts.page(params[:page])
  end
 
  def favorites
     userfavorites = @user.favorite_posts
     @favorites = userfavorites.page(params[:page])
  
  end

  def following
    @title = "フォロー"
    @users = @user.followed_users
    render 'show_follow'
  end

  def followers
    @title = "フォロワー"
    @users = @user.followers
    render 'show_follow'
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

end
