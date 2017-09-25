class ReservationsController < ApplicationController
before_action :authenticate_user!
before_action :is_admin?, except: [:new, :create, :success]


  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)

      respond_to do |format|
        if @reservation.save

          #sending emails to reservation user and admin
        #  ReservationMailer.request_email(@reservation).deliver
        #  ReservationMailer.request_admin_email(@reservation).deliver

          format.html {redirect_to success_path}
          format.js
         else
            format.html {render 'new'
            flash.now[:danger] = 'Bitte Felder überprüfen.'
           } # Not quite right!
          #  flash[:success] = "Reservierung wurde erfolgreich gespeichert"


    end
   end
  end

  def update
    @reservation = Reservation.find(params[:id])

    if @reservation.update_attributes(reservation_params)
      # Handle a successful update.
      flash.now[:success] = 'Reservierung wurde erfolgreich geändert.'
      redirect_to all_path
    else
      render 'edit'
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    Reservation.find(params[:id]).destroy
    flash[:success] = "Reservierung erfolgreich gelöscht"
    redirect_to all_path
  end

  def index
    @reservation = Reservation.paginate(:page => params[:page], :per_page => 10)
    #Post.paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @reservation = Reservation.find(params[:id])
    @day = ((@reservation.end_time - @reservation.start_time)/60/60/24).to_i
  end

  def success
  end


  def calendar
    @reservation = Reservation.all

  end

  def conflicts
    @reservation = Reservation.paginate(:page => params[:page], :per_page => 10).where(:accepted => false)

  end

  def accept
    @reservation = Reservation.find(params[:id])
    overlaps = Reservation.where('start_time <= ? AND end_time >= ?', @reservation.end_time, @reservation.start_time)
      if overlaps.count == 1 && overlaps.first.id == @reservation.id
      #return if overlaps.count == 1 && overlaps.first.id == id
      @reservation.update_attribute(:accepted, true)
      flash[:info]  = "Die Anfrage wurde nun bestätigt. Eine Bestätigungsemail wurde versendet."
      #sending emails to reservation user and admin
      ReservationMailer.accept_email(@reservation).deliver
      redirect_to all_path
      else
      flash[:danger]  = "Es gibt überschneidungen bei den Buchungen."
      redirect_to all_path
    end
  end

  def overbooking
      reservation = Reservation.find(params[:id])
      overlaps = Reservation.where('start_time <= ? AND end_time >= ?', reservation.end_time, reservation.start_time)
      if overlaps.count == 1 && overlaps.first.id == reservation.id
      #return if overlaps.count == 1 && overlaps.first.id == id
      flash[:info]  = "Keine überschneidung"
      redirect_to all_path
      else
      flash[:info]  = "Es gibt überschneidungen bei den Buchungen."
    end
  end

#  def overbooking
#    @initial = Reservation.find(params[:id])
#    @reservations = Reservation.all
#    @reservations.each do |reservation|
#      (reservation.start_time..reservation.end_time).overlaps?(initial.start_time..initial.end_time)
#    end
#  end


  private

    def reservation_params
      params.require(:reservation).permit(:name, :email, :start_time,
                                   :end_time, :accepted)
    end



end
