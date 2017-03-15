elem = $('table tr[data-id=<%= @message.id %>]')
elem.addClass("animated zoomOutUp")
setTimeout ->
  elem.remove()
, 800
