class Equipment < ApplicationRecord
    has_many :mantainers
    mount_uploader :photo, PhotoUploader
    has_one_attached :photo

     def self.available
      where(mantainer_id: nil) # O cualquier condición que determines que un equipo está disponible
    end
end
