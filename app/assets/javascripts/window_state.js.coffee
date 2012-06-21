window.WindowState = class WindowState
    @hasFocus: true
    @unreadMessages: 0

$(window).bind('blur', ->
  WindowState.hasFocus = false
)

$(window).bind('focus', ->
  WindowState.unreadMessages  = 0
  WindowState.hasFocus        = true
  document.title              = "onebigchatroom"
)