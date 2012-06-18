class ApplicationController < ActionController::Base
  protect_from_forgery
protected

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def require_handle
    unless session[:handle]
      session[:return_to] = request.url
      redirect_to root_path
    end
  end

end
