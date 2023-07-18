class Api::V1::ChatsController < Api::V1::ApiController
  def index
    @chats = Chat.where(sender_id: @current_user.id).or(Chat.where(receiver_id: @current_user.id)).order(:last_updated)
    # @chats = @current_user.chats.order(:last_updated)

    render json: @chats, include: [:sender, :receiver, :messages, :last_message]
  end

  def show
    @chat = Chat.find params[:id]
    @chat.unread_messages.each do |message|
      message.update(seen: true)
    end
    render json: @chat, include: [:sender, :receiver, :messages]
  end

  def update
    @chat = Chat.find params[:id]
    if params[:todo] == "block"
      @chat.update blocker_id: @current_user.id
    else
      @chat.update blocker_id: nil
    end
    render json: :done
  end

  def blocked_users
    render json: @current_user.chats.where(blocker_id: @current_user.id), include: [:sender, :receiver]
  end
end
