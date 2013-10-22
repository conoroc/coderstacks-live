class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def signed_in_user
    if user_signed_in?

      else

      flash[:notice] = 'You need to sign in first'
      redirect_to new_user_session_path
    end
  end

  def store_location
    session[:user_return_to] = request.url
  end
end
