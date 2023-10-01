class EquipmentController < ApplicationController
  before_action :authenticate_user!
  before_action :set_equipment, only: %i[show edit update destroy]
  before_action :check_permissions, except: [:index, :show]

  def index
    @equipment = Equipment.all
  end

  def show
  end

  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(equipment_params)

    if @equipment.save
      redirect_to equipment_path(@equipment), notice: 'Equipment was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @equipment.update(equipment_params)
      redirect_to equipment_path(@equipment), notice: 'Equipment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @equipment.destroy
    redirect_to equipment_index_path, notice: 'Equipment was successfully destroyed.'
  end

  private

  def set_equipment
    @equipment = Equipment.find(params[:id])
  end

  def equipment_params
    params.require(:equipment).permit(:type, :name, :description, :photo)
  end

  def check_permissions
    unless current_user.admin? || (current_user.operador? && action_name.in?(%w[edit update])) || (current_user.regular? && action_name == 'show')
      redirect_to root_path, alert: 'No tienes permisos para realizar esta acción.'
    end
  end
end
