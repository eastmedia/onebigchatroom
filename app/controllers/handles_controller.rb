class HandlesController < ApplicationController
  def new
    redirect_to "/chat" if (session[:handle])
  end

  def create
    session[:handle] = params[:handle][:body]
    redirect_to "/chat"
  end

  def update
    unless params[:handle][:body].empty?
      session[:handle] = params[:handle][:body]

      respond_to do |format|
        format.json { render :json => {:body => session[:handle]} }
      end
    end
  end

end
