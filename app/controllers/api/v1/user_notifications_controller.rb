class Api::V1::UserNotificationsController < Api::V1::ApiController
  def index
    render json: @current_user.user_notifications
  end
end
