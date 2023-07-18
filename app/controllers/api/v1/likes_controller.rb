class Api::V1::LikesController < Api::V1::ApiController
  def create
    if @current_user.is_able_to_like
      ismatch_shouldminus = @current_user.like params[:liker_animal_id], params[:liked_animal_id], params[:liked_user_id]
      render json: ismatch_shouldminus
    else
      render json: :failed
    end
  end
end
