class Client < ApplicationRecord
    has_many :appointments
    has_many :stylists, through: :appointments
    validates :name, :age, presence: {message: "%{value} cannot be empty"}
    validates :age, numericality: {only_integer: true}
end
