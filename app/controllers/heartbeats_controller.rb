class HeartbeatsController < ApplicationController
  before_filter :require_handle

  def show
    render "/messages/index"
  end
end
