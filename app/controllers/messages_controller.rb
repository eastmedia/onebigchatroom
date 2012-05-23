class MessagesController < ApplicationController
  def create
    @message = Message.new(params[:message])
    @message.save
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
  end
end
