class ReservationMailer < ApplicationMailer
   default from: "knaupe@t-online.de"

   def request_email(reservation)
    @reservation = reservation
    @day = ((@reservation.end_time - @reservation.start_time)/60/60/24).to_i
    mail(to: @reservation.email, subject: 'Deine Korsika Anfrage')
   end

   def request_admin_email(reservation)
     @reservation = reservation
     @day = ((@reservation.end_time - @reservation.start_time)/60/60/24).to_i
     @url  = 'http://localhost:3000/all'
     receipients = ["sebastian.daum89@gmail.com", "knaupe@t-online.de"]
     mail(to: receipients, subject: 'Es gibt eine neue Korsika Anfrage')
   end

   def accept_email(reservation)
     @reservation = reservation
     mail(to: @reservation.email, subject: 'Deine Korsika Anfrage wurde bestätigt')
   end

end
