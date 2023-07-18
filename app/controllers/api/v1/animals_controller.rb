class Api::V1::AnimalsController < Api::V1::ApiController
  before_action :set_animal, only: %i[ show edit update destroy ]
  # with('avatars', 'user') inculde

  # GET /animals/1 or /animals/1.json
  def show
    render json: @animal, include: [:type, :breed, :avatars, :user], methods: :likes_count
  end


  def new
    render json: Type.all, include: :breeds
  end
  

  # GET /animals/edit_avatar
  def edit_avatar
    # @animal = Animal.new
  end

  # POST /animals or /animals.json
  def create
    @animal = @current_user.animals.build(name: params[:name], bio: params[:bio], gender: params[:gender], breed_id: params[:breed_id], vaccinated: params[:vaccinated])
    @animal.dob = params[:dob]
    @animal.longitude = @current_user.longitude
    @animal.latitude = @current_user.latitude
    avatar = Cloudinary::Uploader.upload(params[:avatar], use_filename:true, unique_filename:true, overwrite:true)
      if @animal.save
        @animal.avatars.build(url: avatar['secure_url'], caption: params[:bio]).save
        render json: {message: 'created', animal_id: @animal.id}
      else
        render json: :failed
      end
  end

  # PATCH/PUT /animals/1 or /animals/1.json
  def update
      if @animal.update(name: params[:name], bio: params[:bio], vaccinated: params[:vaccinated])
        render json: :updated
      else
        render json: :failed
      end
  end

  # DELETE /animals/1 or /animals/1.json
  def destroy
    @animal.destroy

    render json: :deleted
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def animal_params
      params.require(:animal).permit(:user_id, :breed_id, :name, :gender, :bio, :dob, :vaccinated, :longitude, :latitude)
    end
end
