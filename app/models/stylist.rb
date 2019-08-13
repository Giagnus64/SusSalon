class Stylist < ApplicationRecord
    has_many :appointments
    has_many :clients, through: :appointments
    validates :name, :specialty, presence: {message: "%{value} cannot be empty"} 
end
