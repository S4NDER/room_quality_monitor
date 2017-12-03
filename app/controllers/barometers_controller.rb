class BarometersController < ApplicationController
  before_action :set_barometer, only: [:show, :edit, :update, :destroy]

  # GET /barometers
  # GET /barometers.json
  def index
    @barometers = Barometer.all
  end

  # GET /barometers/1
  # GET /barometers/1.json
  def show
  end

  # GET /barometers/new
  def new
    @barometer = Barometer.new
  end

  # GET /barometers/1/edit
  def edit
  end

  # POST /barometers
  # POST /barometers.json
  def create
    @barometer = Barometer.new(barometer_params)

    respond_to do |format|
      if @barometer.save
        format.html { redirect_to @barometer, notice: 'Barometer was successfully created.' }
        format.json { render :show, status: :created, location: @barometer }
      else
        format.html { render :new }
        format.json { render json: @barometer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barometers/1
  # PATCH/PUT /barometers/1.json
  def update
    respond_to do |format|
      if @barometer.update(barometer_params)
        format.html { redirect_to @barometer, notice: 'Barometer was successfully updated.' }
        format.json { render :show, status: :ok, location: @barometer }
      else
        format.html { render :edit }
        format.json { render json: @barometer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barometers/1
  # DELETE /barometers/1.json
  def destroy
    @barometer.destroy
    respond_to do |format|
      format.html { redirect_to barometers_url, notice: 'Barometer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barometer
      @barometer = Barometer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def barometer_params
      params.require(:barometer).permit(:value)
    end
end
