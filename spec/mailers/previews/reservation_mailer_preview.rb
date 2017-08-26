# Preview all emails at http://localhost:3000/rails/mailers/reservation_mailer
class ReservationMailerPreview < ActionMailer::Preview
  def request_mail_preview
    ReservationMailer.request_email(Reservation.first)
  end

  def request_admin_mail_preview
    ReservationMailer.request_admin_email(Reservation.first)
  end

  def accept_mail_preview
    ReservationMailer.accept_email(Reservation.first)
  end

end
