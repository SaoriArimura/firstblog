class ApplicationController < ActionController::Base
  
  require 'RMagick'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
      protected
      def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :password, :password_confirmation, :profile, :category_id, :image ) }
      end
      def configure_permitted_paramaters
        devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:name, :password, :remember_me) }
      end


  #protect_from_forgery
  def after_sign_in_path_for resource
    users_index_path # ログイン後に遷移したいパス
  end
  #protect_from_forgery
  def after_sign_up_path_for resource
    users_index_path # ログイン後に遷移したいパス
  end
    #protect_from_forgery                                                     
    def after_sign_out_path_for resource
      users_index_path
    end

    def index
    end

    def show
    end

 
end 
