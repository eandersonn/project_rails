class Patient < ApplicationRecord
    has_many :messages
    has_many :messaged_appointments, through: :messages, source: :appointment
    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, uniqueness: true, presence: true
end
