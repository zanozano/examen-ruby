class Mantainer < ApplicationRecord
    belongs_to :equipment
    validates :equipment, presence: true
    mount_uploader :photo, PhotoUploader
end
