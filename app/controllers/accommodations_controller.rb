class AccommodationsController < ApplicationController
  attr_accessor :eachOne, :freeRoomId

  def get_accommodations
    @eachOne = Accommodation.group(:accommodation_type)
  end

  def get_free_room
    query_params = requested_date_and_type
    dateFrom = query_params[:dateFrom].to_datetime.to_s
    dateTo = query_params[:dateTo].to_datetime.to_s
    type = query_params[:type].to_s

    sql_query = "select accommodations.id from accommodations left join reservations
                 on accommodations.id=reservations.accommodation_id
                 where accommodation_type = #{type}
                 and accommodations.id not in (
                  select accommodations.id from accommodations left join reservations
                  on accommodations.id=reservations.accommodation_id
                  where ((dateFrom <= '#{dateFrom}' and '#{dateFrom}' <= dateTo)
                  or (dateFrom <= '#{dateTo}' and '#{dateTo}' <= dateTo))
                  and accommodation_type = #{type})
                and case
                  when dateTo is null then 1
                  else dateTo < '#{dateFrom}'
                end
                order by dateTo desc
                limit 1;"
    @freeRoomId = Reservation.find_by_sql(sql_query)
  end

  private
  def requested_date_and_type
    params.permit(:dateFrom, :dateTo, :type)
  end

end