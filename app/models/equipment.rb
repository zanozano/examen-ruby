class Equipment < ApplicationRecord
    has_many :mantainers
    mount_uploader :photo, PhotoUploader
end
