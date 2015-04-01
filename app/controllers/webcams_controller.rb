class WebcamsController < ApplicationController
  before_action :set_webcam, only: [:show, :edit, :update, :destroy]
  @@modes = ["all", "my", "fav"]
  
  # GET /webcams
  # GET /webcams.json
  def index
    @search = ! (params["srch-term"].nil? || params["srch-term"].empty?)
    @searchQry = ""
    @grid = params[:grid].to_b
    @mode = @@modes.first
    if @search
      @showOthers = false
      @searchQry = params["srch-term"]
      @webcams = Webcam.where("name ILIKE :name", {:name => "%#{@searchQry}%"})
    elsif user_signed_in?
      @mode = params[:mode]
      @mode = @@modes.first unless @@modes.include? @mode
      print("mode after")

      if @mode == "my" then
        @webcams = Webcam.where("user_id = ?", current_user.id)
      elsif @mode == "fav"
        @webcams = Webcam.joins(:favoris).where(favoris: {user_id: current_user.id}).order("favoris.ordre")
      else
        @webcams = Webcam.all()
      end
    else
        @webcams = Webcam.all()
    end
    if @mode != "fav"
      @webcams = @webcams.order(:name)
    end
  end

  # GET /webcams/1
  # GET /webcams/1.json
  def show
    @comments = @webcam.comments
    @comment = Comment.new
    @comment.webcam_id = @webcam.id
  end

  # GET /webcams/new
  def new
    return head(:forbidden) unless user_signed_in?
    @webcam = Webcam.new
  end

  # GET /webcams/1/edit
  def edit
    return head(:forbidden) unless @webcam.userCanModify(current_user)
  end
    

  # POST /webcams
  # POST /webcams.json
  def create
    return head(:forbidden) unless user_signed_in?
    @webcam = Webcam.new(webcam_params)
    @webcam.user_id = current_user.id

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
    return head(:forbidden) unless @webcam.userCanModify(current_user)
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
    return head(:forbidden) unless @webcam.userCanModify(current_user)
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
