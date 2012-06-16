class RoomsController < ApplicationController
  def show
    redirect_to root_path unless session[:handle]
    render "/messages/index"
  end
end
