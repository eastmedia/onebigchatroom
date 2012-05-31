class MessagesController < ApplicationController
  def index
    redirect_to root_path unless session[:handle]
  end

  def create
    @message = Message.new(params[:message].merge({:handle => session[:handle]}))
    @message.save
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
  end
end
