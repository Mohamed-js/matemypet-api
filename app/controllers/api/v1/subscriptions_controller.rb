class Api::V1::SubscriptionsController < Api::V1::ApiController
  def show
    render json: @current_user.subscription
  end
end
