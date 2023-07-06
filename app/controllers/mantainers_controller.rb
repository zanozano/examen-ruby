class MantainersController < ApplicationController
  before_action :set_mantainer, only: %i[show edit update destroy]
  require 'csv'

  # GET /mantainers or /mantainers.json
  def index
    @mantainers = Mantainer.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  # GET /mantainers/1 or /mantainers/1.json
  def show
  end

  # GET /mantainers/new
  def new
    @mantainer = Mantainer.new
    @cities = load_cities_from_csv
  end

  # GET /mantainers/1/edit
  def edit
     @mantainer.modified_by_email = current_user.email
  end

  # POST /mantainers or /mantainers.json
  def create
    @mantainer = Mantainer.new(mantainer_params)
    @mantainer.modified_by_email = current_user.email # Asigna el correo electrónico del usuario actual
    
    respond_to do |format|
      if @mantainer.save
        format.html { redirect_to mantainer_url(@mantainer), notice: "Mantainer was successfully created." }
        format.json { render :show, status: :created, location: @mantainer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mantainer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mantainers/1 or /mantainers/1.json
  def update
    @mantainer = Mantainer.find(params[:id])
    @mantainer.modified_by_email = current_user.email # Asigna el correo electrónico del usuario actual

    respond_to do |format|
      if @mantainer.update(mantainer_params)
        format.html { redirect_to mantainer_url(@mantainer), notice: "Mantainer was successfully updated." }
        format.json { render :show, status: :ok, location: @mantainer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mantainer.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /mantainers/1 or /mantainers/1.json
  def destroy
    @mantainer.destroy

    respond_to do |format|
      format.html { redirect_to mantainers_url, notice: "Mantainer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mantainer
    @mantainer = Mantainer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def mantainer_params
  params.require(:mantainer).permit(:equipment_type, :name, :city, :material, :photo, :equipment_id, :support_type, :modified_by_email)
end


  # Load cities from CSV file
  def load_cities_from_csv
    cities = []
    CSV.foreach(Rails.root.join('lib', 'cities.csv'), headers: true) do |row|
      cities << row['city_name']
    end
    cities
  end

  
end
