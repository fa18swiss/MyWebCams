class FavorisController < ApplicationController
  before_action :set_favori, only: [:show, :edit, :update, :destroy]

  # GET /favoris
  # GET /favoris.json
  def index
    @favoris = Favori.all
  end

  # GET /favoris/1
  # GET /favoris/1.json
  def show
  end

  # GET /favoris/new
  def new
    @favori = Favori.new
  end

  # GET /favoris/1/edit
  def edit
  end

  # POST /favoris
  # POST /favoris.json
  def create
    @favori = Favori.new(favori_params)

    respond_to do |format|
      if @favori.save
        format.html { redirect_to @favori, notice: 'Favori was successfully created.' }
        format.json { render :show, status: :created, location: @favori }
      else
        format.html { render :new }
        format.json { render json: @favori.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favoris/1
  # PATCH/PUT /favoris/1.json
  def update
    respond_to do |format|
      if @favori.update(favori_params)
        format.html { redirect_to @favori, notice: 'Favori was successfully updated.' }
        format.json { render :show, status: :ok, location: @favori }
      else
        format.html { render :edit }
        format.json { render json: @favori.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favoris/1
  # DELETE /favoris/1.json
  def destroy
    @favori.destroy
    respond_to do |format|
      format.html { redirect_to favoris_url, notice: 'Favori was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favori
      @favori = Favori.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favori_params
      params.require(:favori).permit(:ordre, :idUser, :idWebCam, :user_id, :webcam_id)
    end
end
