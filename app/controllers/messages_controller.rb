class MessagesController < ApplicationController
  before_filter :require_handle

  def index

  end

  def create
    if (Message.where(["handle = ? AND created_at > ?", session[:handle], 1.minute.ago]).limit(30).count == 30)
      render :js => "window.location = 'http://www.livinginternet.com/i/ia_nq.htm';"
    else
      @message = Message.new(params[:message].merge({:handle => session[:handle]}))
      @message.save
    end
  end

  def destroy
    @destroyer = session[:handle]
    @message   = Message.find(params[:id])
    @message.destroy
  end
end
