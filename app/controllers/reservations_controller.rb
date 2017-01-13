class ReservationsController < ApplicationController

  attr_accessor :services_statistics

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

  def services_statistics
    @services_statistics = {}
    tv = 0
    internet = 0
    parking = 0
    Reservation.all.each do |reservation|
      tv += reservation.boolTv ? 1 : 0
      internet += reservation.boolInternet ? 1 : 0
      parking += reservation.boolParking ? 1 : 0
    end

    @services_statistics.merge!({"tv"=>tv}).merge!({"internet" => internet}).merge!({"parking"=>parking})
  end

  private
  def reservation_params
    params.require(:reservation).permit(:email, :accommodation_id, :dateFrom, :dateTo, :boolTv, :boolParking, :boolInternet)
  end
end