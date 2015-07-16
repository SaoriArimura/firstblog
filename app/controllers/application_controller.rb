class ApplicationController < ActionController::Base

  before_action :current_user_method

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

=begin  
  def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :profile, :image ) }
      end
      def configure_permitted_paramaters
        devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:name, :password, :remember_me) }
      end
      def configure_permitted_parameters
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:current_password, :name, :email, :password, :password_confirmation, :profile, :image ) }
      end

  #protect_from_forgery
  def after_sign_in_path_for resource
    posts_path # ログイン後に遷移したいパス
  end
  #protect_from_forgery
  def after_sign_up_path_for resource
    posts_path # ログイン後に遷移したいパス
  end
=end

#protect_from_forgery                                                     
def after_sign_out_path_for resource
  posts_path
end

# def index
# end

# def show
# end
 private
def current_user_method
 if user_signed_in?
  @current_user = current_user
 end
end

end
