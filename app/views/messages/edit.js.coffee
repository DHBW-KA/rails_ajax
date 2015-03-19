$('body').append '<%=j render file: 'messages/_form.html.slim', layout: 'layouts/modal'%>'
$('#modal').modal().on 'hidden.bs.modal', (e)->
  e.target.remove()