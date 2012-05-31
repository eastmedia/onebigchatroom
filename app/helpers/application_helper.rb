module ApplicationHelper

  def faye_host
     Rails.env.production? ? "onebigchatroom.com" : "localhost"
  end

  def broadcast(channel, &block)
    message = {:channel => channel, :data => capture(&block)}
    uri     = URI.parse("http://#{faye_host}:9292/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end

end
