class Reservation < ApplicationRecord
  validates_presence_of :email, :name, :start_time, :end_time
  default_scope { order(created_at: :desc) }

end
