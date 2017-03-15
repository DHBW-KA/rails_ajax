$('table').prepend('<%=j render @message %>')
$('table tbody tr:first-child').addClass("animated rubberBand")
$('#message_body').val ''