class LuminositiesController < ApplicationController
  before_action :set_luminosity, only: [:show, :edit, :update, :destroy]

  # GET /luminosities
  # GET /luminosities.json
  def index
    @luminosities = Luminosity.all
  end

  # GET /luminosities/1
  # GET /luminosities/1.json
  def show
  end

  # GET /luminosities/new
  def new
    @luminosity = Luminosity.new
  end

  # GET /luminosities/1/edit
  def edit
  end

  # POST /luminosities
  # POST /luminosities.json
  def create
    @luminosity = Luminosity.new(luminosity_params)

    respond_to do |format|
      if @luminosity.save
        format.html { redirect_to @luminosity, notice: 'Luminosity was successfully created.' }
        format.json { render :show, status: :created, location: @luminosity }
      else
        format.html { render :new }
        format.json { render json: @luminosity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /luminosities/1
  # PATCH/PUT /luminosities/1.json
  def update
    respond_to do |format|
      if @luminosity.update(luminosity_params)
        format.html { redirect_to @luminosity, notice: 'Luminosity was successfully updated.' }
        format.json { render :show, status: :ok, location: @luminosity }
      else
        format.html { render :edit }
        format.json { render json: @luminosity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /luminosities/1
  # DELETE /luminosities/1.json
  def destroy
    @luminosity.destroy
    respond_to do |format|
      format.html { redirect_to luminosities_url, notice: 'Luminosity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_luminosity
      @luminosity = Luminosity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def luminosity_params
      params.require(:luminosity).permit(:value)
    end
end
