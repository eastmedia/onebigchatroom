class RoomsController < ApplicationController
  before_filter :require_handle

  def show
    render "/messages/index"
  end
end
