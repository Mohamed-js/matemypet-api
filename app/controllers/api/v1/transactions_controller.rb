class Api::V1::TransactionsController < Api::V1::ApiController
  def create
    transaction = Transaction.create(user_id: params[:user_id], tier_id: params[:tier_id], body: params[:body].to_json, value: params[:value], service_transaction_id: params[:service_transaction_id])
    @current_user.subscription.destroy
    @current_user.create_subscription Tier.find(params[:tier_id])
    render json: :created
  end
end
