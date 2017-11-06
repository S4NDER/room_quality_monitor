class HumiditiesController < ApplicationController
  before_action :set_humidity, only: [:show, :edit, :update, :destroy]

  # GET /humidities
  # GET /humidities.json
  def index
    @humidities = Humidity.all
  end

  # GET /humidities/1
  # GET /humidities/1.json
  def show
  end

  # GET /humidities/new
  def new
    @humidity = Humidity.new
  end

  # GET /humidities/1/edit
  def edit
  end

  # POST /humidities
  # POST /humidities.json
  def create
    @humidity = Humidity.new(humidity_params)

    respond_to do |format|
      if @humidity.save
        format.html { redirect_to @humidity, notice: 'Humidity was successfully created.' }
        format.json { render :show, status: :created, location: @humidity }
      else
        format.html { render :new }
        format.json { render json: @humidity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /humidities/1
  # PATCH/PUT /humidities/1.json
  def update
    respond_to do |format|
      if @humidity.update(humidity_params)
        format.html { redirect_to @humidity, notice: 'Humidity was successfully updated.' }
        format.json { render :show, status: :ok, location: @humidity }
      else
        format.html { render :edit }
        format.json { render json: @humidity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /humidities/1
  # DELETE /humidities/1.json
  def destroy
    @humidity.destroy
    respond_to do |format|
      format.html { redirect_to humidities_url, notice: 'Humidity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_humidity
      @humidity = Humidity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def humidity_params
      params.require(:humidity).permit(:value)
    end
end
