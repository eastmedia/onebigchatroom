@xbxrx = (path) ->
  try
    $.post(path, (data) ->
      count = parseInt(data["count"])
      if (count > 1)
        phrase = "There are #{count} total people in this room"
      else
        phrase = "You are along - invite people!"

      $("#user_count").html(phrase)
    );
  catch error
    #   don't do a finger-lickin' thing
