class ApplicationController < ActionController::Base

  before_action :current_user_method
  protect_from_forgery with: :exception
  
  def after_sign_out_path_for resource
    posts_path
  end

  private
  
  def current_user_method
    if user_signed_in?
      @current_user = current_user
    end
  end

end
