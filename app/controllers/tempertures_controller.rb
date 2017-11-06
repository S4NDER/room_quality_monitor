class TemperturesController < ApplicationController
  before_action :set_temperture, only: [:show, :edit, :update, :destroy]

  # GET /tempertures
  # GET /tempertures.json
  def index
    @tempertures = Temperture.all
  end

  # GET /tempertures/1
  # GET /tempertures/1.json
  def show
  end

  # GET /tempertures/new
  def new
    @temperture = Temperture.new
  end

  # GET /tempertures/1/edit
  def edit
  end

  # POST /tempertures
  # POST /tempertures.json
  def create
    @temperture = Temperture.new(temperture_params)

    respond_to do |format|
      if @temperture.save
        format.html { redirect_to @temperture, notice: 'Temperture was successfully created.' }
        format.json { render :show, status: :created, location: @temperture }
      else
        format.html { render :new }
        format.json { render json: @temperture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tempertures/1
  # PATCH/PUT /tempertures/1.json
  def update
    respond_to do |format|
      if @temperture.update(temperture_params)
        format.html { redirect_to @temperture, notice: 'Temperture was successfully updated.' }
        format.json { render :show, status: :ok, location: @temperture }
      else
        format.html { render :edit }
        format.json { render json: @temperture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tempertures/1
  # DELETE /tempertures/1.json
  def destroy
    @temperture.destroy
    respond_to do |format|
      format.html { redirect_to tempertures_url, notice: 'Temperture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temperture
      @temperture = Temperture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def temperture_params
      params.require(:temperture).permit(:value)
    end
end
