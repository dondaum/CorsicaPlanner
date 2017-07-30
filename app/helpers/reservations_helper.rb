module ReservationsHelper

  def accepted?
    reservation.accepted = true
  end

end
