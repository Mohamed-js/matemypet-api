class Api::V1::MessagesController < Api::V1::ApiController
  def index
    render @current_user.unread_messages
  end

  def create
    message = @current_user.messages.build(chat_id: params[:chat_id], body: params[:body], receiver_id: params[:receiver_id], multimedia: false, video: false)
    if message.save
      message.chat.last_updated = DateTime.now + 2.hours
      return render json: message
    end
    render json: :failed
  end
end
