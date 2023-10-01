class Message < ApplicationRecord
    validates :nombre, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :mensaje, presence: true
end
