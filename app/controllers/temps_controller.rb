class TempsController < ApplicationController
  before_action :set_temp, only: %i[ show edit update destroy ]

  # GET /temps or /temps.json
  def index
    @temps = Temp.all
  end

  # GET /temps/1 or /temps/1.json
  def show
  end

  # GET /temps/new
  def new
    @temp = Temp.new
  end

  # GET /temps/1/edit
  def edit
  end

  # POST /temps or /temps.json
  def create
    @temp = Temp.new(temp_params)

    respond_to do |format|
      if @temp.save
        format.html { redirect_to temp_url(@temp), notice: "Temp was successfully created." }
        format.json { render :show, status: :created, location: @temp }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @temp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /temps/1 or /temps/1.json
  def update
    respond_to do |format|
      if @temp.update(temp_params)
        format.html { redirect_to temp_url(@temp), notice: "Temp was successfully updated." }
        format.json { render :show, status: :ok, location: @temp }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @temp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temps/1 or /temps/1.json
  def destroy
    @temp.destroy

    respond_to do |format|
      format.html { redirect_to temps_url, notice: "Temp was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temp
      @temp = Temp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def temp_params
      params.require(:temp).permit(:name, :email, :login)
    end
end
