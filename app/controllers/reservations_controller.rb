class ReservationsController < ApplicationController

  def add_reservation
    hashJson = reservation_params
    @reservation = Reservation.create(hashJson)
    @reservation.user_id = hashJson[:email]
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