# == Schema Information
#
# Table name: messages
#
#  id         :integer(4)      not null, primary key
#  handle     :string(255)
#  body       :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Message < ActiveRecord::Base
end
