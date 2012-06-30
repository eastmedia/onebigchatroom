# == Schema Information
#
# Table name: heartbeats
#
#  id         :integer(4)      not null, primary key
#  session_id :string(255)
#  room_id    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Heartbeat < ActiveRecord::Base
  #in miliseconds
  INTERVAL = 10000

  scope "recent", lambda { where(["updated_at >= ?", (Heartbeat::INTERVAL/1000).seconds.ago]) }
end
