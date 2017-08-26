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
    @reservation = Reservation.all
    #(a.start_time..a.end_time).overlaps?(b.start_time..b.end_time)
  end

  def accept
    @reservation = Reservation.find(params[:id])
    @reservation.update_attribute(:accepted, true)
    flash[:info]  = "Die Anfrage wurde nun bestätigt. Eine Bestätigungsemail wurde versendet."
    redirect_to all_path
  end


  private

    def reservation_params
      params.require(:reservation).permit(:name, :email, :start_time,
                                   :end_time, :accepted)
    end



end
