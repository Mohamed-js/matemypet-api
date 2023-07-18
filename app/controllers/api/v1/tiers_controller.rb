class Api::V1::TiersController < Api::V1::ApiController
  def index
    render json: Tier.all
  end
end
