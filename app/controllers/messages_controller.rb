class MessagesController < ApplicationController
  before_filter :require_handle

  def index

  end

  def create
    @message = Message.new(params[:message].merge({:handle => session[:handle]}))
    @message.save
  end

  def destroy
    @destroyer = session[:handle]
    @message   = Message.find(params[:id])
    @message.destroy
  end
end
