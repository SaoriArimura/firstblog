class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
 # before_action :no_layout_action
  def index
    @users = User.all
    render :layout => nil
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to  admins_users_path
  end

  #def no_layout_action
   # render layout: false
 # end
end
