class HeartbeatsController < ApplicationController
  before_filter :require_handle

  def create
    heartbeat = Heartbeat.find_or_create_by_session_id_and_room_id(session[:session_id], params[:room_id])
    heartbeat.update_attribute(:updated_at, Time.now.utc)
    render :json => { :count => Heartbeat.where(["room_id = ?", params[:room_id]]).recent.count }
  end

end
