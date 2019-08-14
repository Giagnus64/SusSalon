class Stylist < ApplicationRecord
    has_many :appointments, dependent: :destroy
    has_many :clients, through: :appointments
    validates :name, :specialty, presence: {message: "%{value} cannot be empty"} 



end
