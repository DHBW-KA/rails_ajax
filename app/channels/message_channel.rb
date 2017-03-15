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
    ActionCable.server.broadcast CHANNEL_KEY, action: "create", msg: render_message
  end

  def delete data
    @message = Message.find(data["id"])
    @message.destroy
    ActionCable.server.broadcast CHANNEL_KEY, action: "delete", id: @message.id
  end

  private
  def render_message
    MessagesController.render partial: 'messages/message', locals: {message: @message}
  end
end
