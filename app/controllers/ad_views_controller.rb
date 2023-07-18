class AdViewsController < ApplicationController
  before_action :set_ad_view, only: %i[ show edit update destroy ]

  # GET /ad_views or /ad_views.json
  def index
    @ad_views = AdView.all
  end

  # GET /ad_views/1 or /ad_views/1.json
  def show
  end

  # GET /ad_views/new
  def new
    @ad_view = AdView.new
  end

  # GET /ad_views/1/edit
  def edit
  end

  # POST /ad_views or /ad_views.json
  def create
    @ad_view = AdView.new(ad_view_params)

    respond_to do |format|
      if @ad_view.save
        format.html { redirect_to ad_view_url(@ad_view), notice: "Ad view was successfully created." }
        format.json { render :show, status: :created, location: @ad_view }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ad_view.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ad_views/1 or /ad_views/1.json
  def update
    respond_to do |format|
      if @ad_view.update(ad_view_params)
        format.html { redirect_to ad_view_url(@ad_view), notice: "Ad view was successfully updated." }
        format.json { render :show, status: :ok, location: @ad_view }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ad_view.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ad_views/1 or /ad_views/1.json
  def destroy
    @ad_view.destroy

    respond_to do |format|
      format.html { redirect_to ad_views_url, notice: "Ad view was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad_view
      @ad_view = AdView.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ad_view_params
      params.require(:ad_view).permit(:is_liked, :longitude, :latitude, :country, :city, :ad_id, :user_id)
    end
end
