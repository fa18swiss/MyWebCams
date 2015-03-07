class WebcamsController < ApplicationController
  before_action :set_webcam, only: [:show, :edit, :update, :destroy]

  # GET /webcams
  # GET /webcams.json
  def index
    @webcams = Webcam.all
  end

  # GET /webcams/1
  # GET /webcams/1.json
  def show
  end

  # GET /webcams/new
  def new
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
      params.require(:webcam).permit(:nom, :url, :latitude, :longitude, :orientation, :idUser, :user_id)
    end
end
