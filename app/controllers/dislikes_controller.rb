class DislikesController < ApplicationController
  before_action :set_dislike, only: %i[ show edit update destroy ]

  # GET /dislikes or /dislikes.json
  def index
    @dislikes = Dislike.all
  end

  # GET /dislikes/1 or /dislikes/1.json
  def show
  end

  # GET /dislikes/new
  def new
    @dislike = Dislike.new
  end

  # GET /dislikes/1/edit
  def edit
  end

  # POST /dislikes or /dislikes.json
  def create
    @dislike = Dislike.new(dislike_params)

    respond_to do |format|
      if @dislike.save
        format.html { redirect_to dislike_url(@dislike), notice: "Dislike was successfully created." }
        format.json { render :show, status: :created, location: @dislike }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dislike.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dislikes/1 or /dislikes/1.json
  def update
    respond_to do |format|
      if @dislike.update(dislike_params)
        format.html { redirect_to dislike_url(@dislike), notice: "Dislike was successfully updated." }
        format.json { render :show, status: :ok, location: @dislike }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dislike.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dislikes/1 or /dislikes/1.json
  def destroy
    @dislike.destroy

    respond_to do |format|
      format.html { redirect_to dislikes_url, notice: "Dislike was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dislike
      @dislike = Dislike.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dislike_params
      params.require(:dislike).permit(:disliker_animal_id, :disliker_user_id, :disliked_animal_id)
    end
end
