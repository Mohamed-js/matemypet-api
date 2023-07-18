class Api::V1::DislikesController < Api::V1::ApiController
  def create
    @current_user.dislikes.build(disliked_animal_id: params[:disliked_animal_id], disliker_animal_id: params[:disliker_animal_id], disliker_user_id: params[:disliker_user_id]).save
  end
end
