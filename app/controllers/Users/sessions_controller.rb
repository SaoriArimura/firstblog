class Users::SessionsController < Devise::SessionsController
  # before_filter :configure_sign_in_params, only: [:create]
  before_action :configure_sign_in_params

  def configure_sign_in_params
    devise_parameter_sanitizer.for(:sign_in) do |u| 
      u.permit(:name, :password) 
    end
  end
  def after_sign_in_path_for resource
    posts_path # ログイン後に遷移したいパス
  end
  #
  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
