class MessageChannel < ApplicationCable::Channel
  CHANNEL_KEY = "chat"

  def subscribed
    stream_from CHANNEL_KEY
    ActionCable.server.broadcast CHANNEL_KEY, action: "list", messages: render_messages
  end
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def create data
    @message = Message.create body: data["msg"], ip: user_ip
    ActionCable.server.broadcast CHANNEL_KEY, action: "create", body: render_message
  end


  def destroy data
    @message = Message.find(data["id"])
    @message.destroy
    ActionCable.server.broadcast CHANNEL_KEY, action: "destroy", id: @message.id
  end

  private
  def render_message
    MessagesController.render @message
  end

  def user_ip
    connection.env["REMOTE_ADDR"]
  end

  def render_messages
    Message.all.map do |message|
      MessagesController.render message
    end
  end

end
