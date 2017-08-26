class ReservationMailer < ApplicationMailer
   default from: "from@example.com"

   def request_email(reservation)
    @reservation = reservation
    @day = ((@reservation.end_time - @reservation.start_time)/60/60/24).to_i
    mail(to: @reservation.email, subject: 'Deine Korsika Anfrage')
   end

   def request_admin_email(reservation)
     @reservation = reservation
     @day = ((@reservation.end_time - @reservation.start_time)/60/60/24).to_i
     @url  = 'http://localhost:3000/all'
     mail(to: "sebastian.daum89@gmail.com", subject: 'Es gibt eine neue Korsika Anfrage')
   end

   def accept_email(reservation)
     @reservation = reservation
     mail(to: @reservation.email, subject: 'Deine Korsika Anfrage wurde bestätigt')
   end

end
