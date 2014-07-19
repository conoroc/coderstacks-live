class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception


  before_filter :get_search
  def get_search
    @search = Resource.search(params[:q])
  end



  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }
  end

  def signed_in_user
    if user_signed_in?

    else

      flash[:notice] = 'You need to sign in first'
      redirect_to new_user_session_path
    end
  end

  def signed_in_admin?
    current_user.admin?
  end

  def store_location
    session[:user_return_to] = request.url
  end


end
