module MessagesHelper

  def hidden_box_for(*names)
    return_string = ""
    names.each do |name|
      return_string << "<div id='#{name}' style='position:fixed;display:none;top:10%;left:35%'>"
      return_string <<  image_tag("#{name}.jpg", :id => "#{name}_pic")
      return_string <<  "</div>"
    end
    return_string
  end

  def format_message(message)
    auto_link(message, :html => {:target => "_blank"})
  end
end
