class HandlesController < ApplicationController
  def new
    redirect_to "/chat" if (session[:handle])
  end

  def create
    session[:handle] = params[:handle][:body]
    redirect_to "/chat"
  end
end
