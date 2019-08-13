class Appointment < ApplicationRecord
  belongs_to :client
  belongs_to :stylist
  validates :time, inclusion: {in: 1..7, message: "The salon only schedules appointments at the top of the hour between 1 and 7 PM"}
end
