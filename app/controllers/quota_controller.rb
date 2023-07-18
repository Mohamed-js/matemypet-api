class QuotaController < ApplicationController
  before_action :set_quotum, only: %i[ show edit update destroy ]

  # GET /quota or /quota.json
  def index
    @quota = Quotum.all
  end

  # GET /quota/1 or /quota/1.json
  def show
  end

  # GET /quota/new
  def new
    @quotum = Quotum.new
  end

  # GET /quota/1/edit
  def edit
  end

  # POST /quota or /quota.json
  def create
    @quotum = Quotum.new(quotum_params)

    respond_to do |format|
      if @quotum.save
        format.html { redirect_to quotum_url(@quotum), notice: "Quotum was successfully created." }
        format.json { render :show, status: :created, location: @quotum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quotum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quota/1 or /quota/1.json
  def update
    respond_to do |format|
      if @quotum.update(quotum_params)
        format.html { redirect_to quotum_url(@quotum), notice: "Quotum was successfully updated." }
        format.json { render :show, status: :ok, location: @quotum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quotum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quota/1 or /quota/1.json
  def destroy
    @quotum.destroy

    respond_to do |format|
      format.html { redirect_to quota_url, notice: "Quotum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quotum
      @quotum = Quotum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quotum_params
      params.require(:quotum).permit(:user_id, :subscription_id, :likes, :has_unlimited_likes, :likes_updated, :first_like_date, :max_file_size, :pets)
    end
end
