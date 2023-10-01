class Equipment < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    has_many :maintainers, dependent: :destroy
    mount_uploader :photo, PhotoUploader
    has_one_attached :photo

     def self.available
      where(maintainer_id: nil)
    end
end
