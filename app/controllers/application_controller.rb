require 'data_table'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user_session, :current_user
  # filter_parameter_logging :password, :password_confirmation

  protected

  def show_errors(exception)
    @e = exception
    respond_to do |format|
      format.js { render 'errors/show' }
      format.html { render 'errors/show' }
    end
  end

  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def require_user
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to root_url
        return false
      end
    end

    def store_location
      session[:return_to] = request.original_fullpath
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
end
