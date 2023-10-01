class Maintainer < ApplicationRecord
    belongs_to :equipment
    validates :equipment, presence: true
    mount_uploader :photo, PhotoUploader
    has_one_attached :photo
end
