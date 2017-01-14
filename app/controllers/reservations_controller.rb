class ReservationsController < ApplicationController

  attr_accessor :services_statistics, :unconfirmed_reservations ,:tv_statistics, :internet_statistics, :parking_statistics

  def add_reservation
    hashJson = reservation_params
    user = User.find_by email: hashJson[:email]
    #ne smije rezervirati
    if user.confirm_status === 1
      respond_to do |format|
        format.json {render :reservation_failed}
      end and return
    end

    @reservation = Reservation.create(hashJson)
    @reservation.user_id = hashJson[:email]

    if @reservation.save
      if user.confirm_status === 0
        user.update(confirm_status: 1)
      end
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

    @services_statistics.merge!({"tv" => tv}).merge!({"internet" => internet}).merge!({"parking" => parking})
  end

  def service_dependencies
    tv_query = "select reservations.number_of_persons, persons.country ,count(reservations.id)
	              from appartmani_app.reservations join appartmani_app.persons
	              on reservations.user_id = persons.user_id
                where reservations.boolTV = true
                group by reservations.number_of_persons, persons.country;"
    @tv_statistics = ActiveRecord::Base.connection.execute(tv_query)

    internet_query = "select reservations.number_of_persons, persons.country ,count(reservations.id)
                      from appartmani_app.reservations join appartmani_app.persons
                      on reservations.user_id = persons.user_id
                      where reservations.boolInternet = true
                      group by reservations.number_of_persons, persons.country;"
    @internet_statistics = ActiveRecord::Base.connection.execute(internet_query)

    parking_query = "select reservations.number_of_persons, persons.country ,count(reservations.id)
                    from appartmani_app.reservations join appartmani_app.persons
                    on reservations.user_id = persons.user_id
                    where reservations.boolParking = true
                    group by reservations.number_of_persons, persons.country;"
    @parking_statistics = ActiveRecord::Base.connection.execute(parking_query)
  end

  def get_unconfirmed_reservations
    sql_query = "select reservations.user_id, reservations.email, reservations.dateFrom, reservations.dateTo, accommodations.accommodation_type
                 from reservations join accommodations
                 on reservations.accommodation_id = accommodations.id
                 join users on reservations.user_id = users.id
                 where users.confirm_status = 0;"
    @unconfirmed_reservations = ActiveRecord::Base.connection.execute(sql_query)

  end

  def confirm_first_reservation
    hashJson = user_id_and_status
    user = User.find(hashJson[:user_id])
    if hashJson[:status] == 1
      #ne treba vise potvrdivati rezervacije
      user.update(confirm_status: 2)
      respond_to do |format|
        format.json {render :confirm}
      end
    elsif hashJson[:status] == 0
      #nema potvrdenih rezervacija opet isto
      user.reservations.destroy_all
      user.update(confirm_status: 0)
      respond_to do |format|
        format.json {render :unconfirm}
      end
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:email, :accommodation_id, :dateFrom, :dateTo, :boolTv, :boolParking, :boolInternet)
  end

  def user_id_and_status
    params.permit(:user_id, :status)
  end
end