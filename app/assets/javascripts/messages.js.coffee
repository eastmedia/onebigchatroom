# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

delete_sound = new buzz.sound("/sounds/delete_message", {
  formats: [ "ogg", "mp3"]
});

new_message_sound_1 = new buzz.sound("sounds/new_message1", {
  formats: ["ogg", "mp3"]
});

new_message_sound_2 = new buzz.sound("sounds/new_message2", {
  formats: ["ogg", "mp3"]
});

new_message_sound_3 = new buzz.sound("sounds/new_message3", {
  formats: ["ogg", "mp3"]
});

new_message_sound_4 = new buzz.sound("sounds/new_message4", {
  formats: ["ogg", "mp3"]
});

queue = [new_message_sound_1, new_message_sound_2, new_message_sound_3, new_message_sound_4]

#   Functions
shuffle = (arr) ->
    i = arr.length;
    if i == 0 then return false

    while --i
        j = Math.floor(Math.random() * (i+1))
        tempi = arr[i]
        tempj = arr[j]
        arr[i] = tempj
        arr[j] = tempi
    return arr

@play_delete = () ->
  delete_sound.play();

@play_new = () ->
  shuffle(queue)[0].play();

@person_appears = (name) ->
  person_div = $("##{name}")
  person_sound = new buzz.sound("sounds/#{name}", { formats: ["ogg", "mp3"] })

  person_sound.bind("ended", ->
    person_div.hide("fast")
  )

  person_div.show("fast")
  person_sound.play()


@zeus_remove = () ->
  zeus_div = $("#zeus")
  zeus_sound = new buzz.sound("sounds/zeus", { formats: ["ogg", "mp3"] })

  zeus_sound.bind("ended", ->
    zeus_div.hide("fast")
    $("#messages").html("")
  )

  zeus_div.show("fast")
  zeus_sound.play()

@isScrolledIntoView = (elem) ->
  docViewTop    = $(window).scrollTop();
  docViewBottom = docViewTop + $(window).height();
  elemTop       = $(elem).offset().top
  elemBottom    = elemTop + $(elem).height()

  (elemBottom <= docViewBottom) && (elemTop >= docViewTop)

#  Transform anchor tags to images
$("a.autolinked").live("messageadded", (event) ->
  formats     = ['.jpg', '.jpeg', '.gif', '.png']
  the_element = $(event.target)
  the_href    = the_element.attr('href')

  for format, i in formats
    if the_href.indexOf(format) != -1
      random_id = parseInt(Math.random()*4206969666).toString()
      the_element.replaceWith("<a href='#{the_href}' target='_new'><img id='#{random_id}' src='#{the_href}'></img><a/>")
    else
      # this link won't be parsed again, so $("a.autolinked") won't pick it up. Good!
      the_element.removeClass("autolinked")
)