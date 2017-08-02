class ReservationsController < ApplicationController
before_action :authenticate_user!


  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
        redirect_to root_path
        flash[:success] = "Reservierung wurde erfolgreich gespeichert"

    else
    #  flash.now[:danger] = 'Bitte Felder überprüfen.' # Not quite right!
      render 'new'
    end
  end

  def update
    @reservation = Reservation.find(params[:id])

    if @reservation.update_attributes(reservation_params)
      # Handle a successful update.
      flash.now[:success] = 'Reservierung wurde erfolgreich geändert.'
      render 'show'
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
    @reservation = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end


  private

    def reservation_params
      params.require(:reservation).permit(:name, :email, :start_time,
                                   :end_time, :accepted)
    end

end
