# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

delete_sound = new buzz.sound("/sounds/delete_message", {
    formats: [ "ogg", "mp3"]
});

@play_delete = () ->
  delete_sound.play();
