class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.admin = true  # Marca al nuevo usuario como administrador si así se desea

    if @user.save
      redirect_to root_path, notice: 'Usuario creado exitosamente.'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
