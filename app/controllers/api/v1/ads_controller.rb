class Api::V1::AdsController < Api::V1::ApiController
  def index
    render json: Ad.all
  end

  def update
    ad = Ad.find(params[:id])
    ad.views += 1
    view = View.new(longitude: @current_user.longitude, latitude:  @current_user.latitude, country:  @current_user.country, city: @current_user.city, user_id: @current_user.id)

    if params[:add_like] 
      ad.likes += 1
      view.liked = true
    end

    ad.save
    view.save
  end
end
