module ApplicationHelper

  def faye_host
     Rails.env.development? ? "localhost:9292" : "onebigchatroom.com:443"
  end

  def broadcast(channel, &block)
    puts channel
    password = Onebigchatroom::Application.config.faye_password
    message  = {:channel => channel, :data => capture(&block), :ext => {:password => password}}
    uri      = URI.parse("http://#{faye_host}/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end

end
