class HeartbeatsController < ApplicationController
  before_filter :require_handle

  def create
    Heartbeat.find_or_create_by_session_id_and_room_id(session[:session_id], params[:room_id])
    render :text => ""
  end

end
