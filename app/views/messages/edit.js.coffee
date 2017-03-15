$('body').append '<%=j render file: 'messages/_form.html.slim', layout: 'layouts/modal'%>'
$('#modal').modal(
  complete: (e)->
    $('#modal').remove()
).modal("open")