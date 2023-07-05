class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :lockable

  # Añade el atributo :admin
  def admin?
    admin
  end
end
