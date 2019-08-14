class Client < ApplicationRecord
    has_many :appointments, dependent: :destroy
    has_many :stylists, through: :appointments
    validates :name, :age, presence: {message: "%{value} cannot be empty"}
    validates :age, numericality: {greater_than: 18}
end
