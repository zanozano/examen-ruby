class MaintainersController < ApplicationController
  before_action :set_maintainer, only: %i[show edit update destroy]
  require 'csv'

  def load_support_options
    file_path = Rails.root.join('lib', 'assets', 'supports.csv') 
    @support_options = File.read(file_path).split("\n")
  end

  def load_cities_from_csv
    file_path = Rails.root.join('lib', 'assets', 'cities.csv')
    @city_options = File.read(file_path).split("\n")
  end

  def load_materials_from_csv
    file_path = Rails.root.join('lib', 'assets', 'materials.csv')
    @material_options = File.read(file_path).split("\n")
  end

  # GET /maintainers or /maintainers.json
  def index
    @maintainers = Maintainer.order(updated_at: :desc).paginate(page: params[:page], per_page: 3)
  end

  # GET /maintainers/1 or /maintainers/1.json
  def show
  end


  # GET /maintainers/new
  def new
    load_support_options
    load_cities_from_csv
    load_materials_from_csv
    @maintainer = Maintainer.new
  end

  # GET /maintainers/1/edit
  def edit
    load_support_options
    load_cities_from_csv
    load_materials_from_csv
    @maintainer.modified_by_email = current_user.email
  end

  # POST /maintainers or /maintainers.json
  def create
    @maintainer = Maintainer.new(maintainer_params)
    @maintainer.modified_by_email = current_user.email
    
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
    @maintainer.modified_by_email = current_user.email

    respond_to do |format|
      if @maintainer.update(maintainer_params)
        if @maintainer.equipment.update(photo: @maintainer.photo)
          format.html { redirect_to maintainer_url(@maintainer), notice: "Maintainer was successfully updated." }
          format.json { render :show, status: :ok, location: @maintainer }
        else
          format.html { redirect_to maintainer_url(@maintainer), alert: "Failed to update Equipment photo." }
          format.json { render json: @maintainer.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maintainer.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /maintainers/1 or /maintainers/1.json
  def destroy
    @maintainer = Maintainer.find(params[:id])
    @equipment = @maintainer.equipment

    if @maintainer.destroy
      # Eliminar registros relacionados en "Maintainers"
      Maintainer.where(equipment_id: @equipment.id).destroy_all

      # Eliminar el equipo
      @equipment.destroy

      redirect_to maintainers_url, notice: "Maintainer and related Equipment were successfully destroyed."
    else
      # Manejo de errores si la eliminación falla
      flash[:alert] = "Failed to destroy Maintainer."
      redirect_to maintainers_url
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


  
end
