class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.all
    render :layout => nil
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to  admins_users_path
  end

end
