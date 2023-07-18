class Api::V1::RecommendationsController < Api::V1::ApiController
    before_action :set_animal, only: %i[ index ]
    # TODO :: Make a job for auto genereating likes for users who exceeded the renewal time
    def index
        render json: @animal.recommendations(recommendations_params), include: :avatars
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.find(params[:id])
    end
    def recommendations_params
        params.permit(:id, :min_age, :max_age, :same_breed, :no_vaccination_needed, :distance, :global, :first_load)
    end
end
