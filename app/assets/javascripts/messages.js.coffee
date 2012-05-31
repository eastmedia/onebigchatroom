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