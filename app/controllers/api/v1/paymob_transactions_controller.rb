class Api::V1::PaymobTransactionsController < Api::V1::ApiController
  def create
    PaymobTransaction.create(data: params[:obj], t_id: params[:obj][:id])
  end
end
