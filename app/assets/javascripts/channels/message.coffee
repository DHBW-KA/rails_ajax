App.message = App.cable.subscriptions.create "MessageChannel",
  connected: ->
    $("form").submit (e) =>
      @create $("#message_body").val()
      $('#message_body').val ''
      return false
    $('body').on "click", "tr a.delete", (e) =>
      e.preventDefault()
      @delete $(e.target).closest("tr").data("id")
      return false

  disconnected: ->
    $("form").off("submit")
    $('body').off "click", "tr a.delete"

  received: (data) ->
    if data.action == "create"
      $('table').prepend(data.body)
      $('table tbody tr:first-child').addClass("animated rubberBand")
    else if data.action == "destroy"
      elem = $("table tr[data-id=#{data.id}]")
      elem.addClass "animated zoomOutUp"
      setTimeout ->
        elem.remove()
      , 800
    else if data.action == "list"
      elem = $("table tbody tr").remove()
      $("table").prepend(msg) for msg in data.messages

  create: (msg) ->
    @perform 'create', msg: msg

  delete: (id) ->
    @perform 'destroy', id: id