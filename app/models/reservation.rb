class Reservation < ApplicationRecord
  validates_presence_of :email, :name, :start_time, :end_time


end
