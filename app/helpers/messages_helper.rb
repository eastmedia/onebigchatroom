module MessagesHelper
  def format_message(message)
    auto_link(message, :html => {:target => "_blank"})
  end
end
