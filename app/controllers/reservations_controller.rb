class ReservationsController < ApplicationController

  def add_reservation
    @reservation = Reservation.create(reservation_params)
    if @reservation.save
      respond_to do |format|
        format.json {render :add_reservation}
      end
    else
      respond_to do |format|
        format.json {render :reservation_failed}
      end
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:email, :accommodation_id, :dateFrom, :dateTo, :boolTv, :boolParking, :boolInternet)
  end
end