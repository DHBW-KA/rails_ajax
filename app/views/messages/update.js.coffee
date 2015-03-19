<% if @message.errors.any? %>
  input = $('#modal').find('#message_body')
  input.closest('.form-group').addClass 'has-error'
  input.after "<span class=\"help-block\"><%= @message.errors[:body].join '<br />' %></span>"
<% else %>
  $('#modal').modal('hide')
  $('tr[data-id="<%=@message.id %>"]').replaceWith $('<%=j render @message %>')
<% end %>