class MessagesController < ApplicationController
  before_filter :require_handle

  def index

  end

  def create
    if (ban_jerks)
      render :js => "window.location = 'http://www.livinginternet.com/i/ia_nq.htm';"
    else
      @message = Message.new(params[:message].merge({:handle => session[:handle]}))
      @message.save
    end
  end

  def destroy
    @destroyer = session[:handle]
    @message   = Message.find(params[:id])
    @message.update_attributes(:deleted_by => session[:handle])

    if (ban_jerks)
      render :js => "window.location = 'http://www.livinginternet.com/i/ia_nq.htm';"
    end
  end

private

  def ban_jerks
    (Message.where(["handle = ? AND created_at > ?", session[:handle], 2.minute.ago]).limit(30).count == 30) || (Message.where(["deleted_by = ? AND created_at > ?", session[:handle], 1.minute.ago]).limit(10).count == 10)
  end

end
