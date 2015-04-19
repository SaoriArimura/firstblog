class UsersController < ApplicationController
 
 # before_action :signed_in_user,
  #                  only: [:index, :show, :destroy, :edit, :update, :following, :followers]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])   
    @posts = @user.posts
  end

  def favorites
    @user = User.find(params[:id])
  end


  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end


end
