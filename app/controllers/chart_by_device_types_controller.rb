class ChartByDeviceTypesController < ApplicationController
  before_action :set_chart_by_device_type, only: [:show, :edit, :update, :destroy]

  # GET /chart_by_device_types
  # GET /chart_by_device_types.json
  def index
    @chart_by_device_types = ChartByDeviceType.all
  end

  # GET /chart_by_device_types/1
  # GET /chart_by_device_types/1.json
  def show
  end

  # GET /chart_by_device_types/new
  def new
    @chart_by_device_type = ChartByDeviceType.new
  end

  # GET /chart_by_device_types/1/edit
  def edit
  end

  # POST /chart_by_device_types
  # POST /chart_by_device_types.json
  def create
    @chart_by_device_type = ChartByDeviceType.new(chart_by_device_type_params)

    respond_to do |format|
      if @chart_by_device_type.save
        format.html { redirect_to @chart_by_device_type, notice: 'Chart by device type was successfully created.' }
        format.json { render :show, status: :created, location: @chart_by_device_type }
      else
        format.html { render :new }
        format.json { render json: @chart_by_device_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chart_by_device_types/1
  # PATCH/PUT /chart_by_device_types/1.json
  def update
    respond_to do |format|
      if @chart_by_device_type.update(chart_by_device_type_params)
        format.html { redirect_to @chart_by_device_type, notice: 'Chart by device type was successfully updated.' }
        format.json { render :show, status: :ok, location: @chart_by_device_type }
      else
        format.html { render :edit }
        format.json { render json: @chart_by_device_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chart_by_device_types/1
  # DELETE /chart_by_device_types/1.json
  def destroy
    @chart_by_device_type.destroy
    respond_to do |format|
      format.html { redirect_to chart_by_device_types_url, notice: 'Chart by device type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chart_by_device_type
      @chart_by_device_type = ChartByDeviceType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chart_by_device_type_params
      params.fetch(:chart_by_device_type, {})
    end
end
