require 'faye'
Faye::WebSocket.load_adapter('thin')

require File.expand_path('../config/environment', __FILE__)

class Authentication
  def required_password
    Onebigchatroom::Application.config.faye_password
  end
  
  def incoming(message, callback)
    if message['channel'] !~ /^\/meta\//
      password = message['ext'].is_a?(Hash) && message['ext']['password']
      unless password == required_password
        message['error'] = '401:ext.password:Password required for publishing'
      end
    end
    callback.call(message)
  end
  
  def outgoing(message, callback)
    if message['ext'].is_a?(Hash)
      message['ext'].delete('password')
      message.delete('ext') if message['ext'].empty?
    end
    callback.call(message)
  end
end

faye_server = Faye::RackAdapter.new(:mount => "/faye", :timeout => 25)
faye_server.add_extension(Authentication.new)
run faye_server

