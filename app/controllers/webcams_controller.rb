class WebcamsController < ApplicationController
  before_action :set_webcam, only: [:show, :edit, :update, :destroy]

  # GET /webcams
  # GET /webcams.json
  def index
    @search = ! params["srch-term"].nil?
    @searchQry = ""
    @params = params
    if not @search
      @webcams = Webcam.order(:name)
      @grid = params[:grid].to_b
      @showFavorites = params[:showFavorites].to_b
      @showMy = params[:showMy].to_b
      @showOthers = params[:showOthers].to_b
      if not @showFavorites and not @showMy and not @showOthers then
        @showOthers = true
      end
    else
      @grid = true
      @showFavorites = false
      @showMy = false
      @showOthers = true
      @searchQry = params["srch-term"]
      @webcams = Webcam.where("name ILIKE :name", {:name => "%#{@searchQry}%"})
    end
  end

  # GET /webcams/1
  # GET /webcams/1.json
  def show
  end

  # GET /webcams/new
  def new
    return head(:forbidden) unless user_signed_in?
    @webcam = Webcam.new
  end

  # GET /webcams/1/edit
  def edit
  end

  # POST /webcams
  # POST /webcams.json
  def create
    @webcam = Webcam.new(webcam_params)

    respond_to do |format|
      if @webcam.save
        format.html { redirect_to @webcam, notice: 'Webcam was successfully created.' }
        format.json { render :show, status: :created, location: @webcam }
      else
        format.html { render :new }
        format.json { render json: @webcam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /webcams/1
  # PATCH/PUT /webcams/1.json
  def update
    respond_to do |format|
      if @webcam.update(webcam_params)
        format.html { redirect_to @webcam, notice: 'Webcam was successfully updated.' }
        format.json { render :show, status: :ok, location: @webcam }
      else
        format.html { render :edit }
        format.json { render json: @webcam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /webcams/1
  # DELETE /webcams/1.json
  def destroy
    @webcam.destroy
    respond_to do |format|
      format.html { redirect_to webcams_url, notice: 'Webcam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_webcam
      @webcam = Webcam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def webcam_params
      params.require(:webcam).permit(:name, :url, :latitude, :longitude, :orientation)
    end
end
