<% if @message.errors.any? %>
  input = $('#message_body')
  input.closest('.form-group').addClass 'has-error'
  input.after "<span class=\"help-block\"><%= @message.errors[:body].join '<br />' %></span>"
<% else %>
  console.log $('#message_body')
  $('#message_body').val('').closest('.form-group').removeClass('has-error').find('.help-block').fadeOut()
<% end %>