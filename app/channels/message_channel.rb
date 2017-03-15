class MessageChannel < ApplicationCable::Channel
  CHANNEL_KEY = "chat"

  def subscribed
    stream_from CHANNEL_KEY
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def create data
    @message = Message.create body: data["msg"]
    ActionCable.server.broadcast CHANNEL_KEY, msg: render_message
  end

  private
  def render_message
    MessagesController.render partial: 'messages/message', locals: {message: @message}
  end
end
