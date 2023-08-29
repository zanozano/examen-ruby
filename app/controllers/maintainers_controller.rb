class MaintainersController < ApplicationController
  before_action :set_maintainer, only: %i[show edit update destroy]
  require 'csv'

  # GET /maintainers or /maintainers.json
  def index
    @maintainers = Maintainer.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  # GET /maintainers/1 or /maintainers/1.json
  def show
  end

  # GET /maintainers/new
  def new
    @maintainer = Maintainer.new
    @cities = load_cities_from_csv
  end

  # GET /maintainers/1/edit
  def edit
     @maintainer.modified_by_email = current_user.email
  end

  # POST /maintainers or /maintainers.json
  def create
    @maintainer = Maintainer.new(maintainer_params)
    @maintainer.modified_by_email = current_user.email # Asigna el correo electrónico del usuario actual
    
    respond_to do |format|
      if @maintainer.save
        format.html { redirect_to maintainer_url(@maintainer), notice: "Maintainer was successfully created." }
        format.json { render :show, status: :created, location: @maintainer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintainer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintainers/1 or /maintainers/1.json
  def update
    @maintainer = Maintainer.find(params[:id])
    @maintainer.modified_by_email = current_user.email # Asigna el correo electrónico del usuario actual

    respond_to do |format|
      if @maintainer.update(maintainer_params)
        format.html { redirect_to maintainer_url(@maintainer), notice: "Maintainer was successfully updated." }
        format.json { render :show, status: :ok, location: @maintainer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maintainer.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /maintainers/1 or /maintainers/1.json
    def destroy
    @equipment = Equipment.find(params[:id])

    # Buscar y eliminar registros en "maintainers" que hacen referencia a este equipo
    Maintainer.where(equipment_id: @equipment.id).destroy_all

    @equipment.destroy

    respond_to do |format|
      format.html { redirect_to equipment_index_url, notice: "Equipment and related Maintainers were successfully destroyed." }
      format.json { head :no_content }
    end
  end



  private

  # Use callbacks to share common setup or constraints between actions.
  def set_maintainer
    @maintainer = Maintainer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def maintainer_params
  params.require(:maintainer).permit(:equipment_type, :name, :city, :material, :photo, :equipment_id, :support_type, :modified_by_email)
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
