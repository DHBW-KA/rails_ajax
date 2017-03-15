App.message = App.cable.subscriptions.create "MessageChannel",
  connected: ->
    $("body").addClass("cable_connected")
    $("form").submit (e) =>
      @create $("#message_body").val()
      return false

  disconnected: ->
    $("body").removeClass("cable_connected")
    $("form").off("submit")

  received: (data) ->
    $('table').prepend(data.msg)
    $('table tbody tr:first-child').addClass("animated rubberBand")
    $('#message_body').val ''

  create: (msg) ->
    @perform 'create', msg: msg