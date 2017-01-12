class PersonsController < ApplicationController
  attr_accessor :country_statistics, :city_statistics

  def create
    @person = Person.create(person_params)

    if @person.save
      respond_to do |format|
        format.json {render :create}
      end
    end
  end

  def show
    @person = Person.find(params[:id])
    respond_to do |format|
      format.json {render :show}
    end
  end

  def country_statistics
    sql_query = "select country, COUNT(reservations.id)
                 from persons join reservations
                 on persons.user_id = reservations.user_id
                 group by country;"
    @country_statistics = ActiveRecord::Base.connection.execute(sql_query)
  end

  def city_statistics
    sql_query = "select city, COUNT(reservations.id)
                 from persons join reservations
                 on persons.user_id = reservations.user_id
                 group by country;"
    @city_statistics = ActiveRecord::Base.connection.execute(sql_query)
  end

  private
  def person_params

    params.require(:person).permit(:name,:surname,:country,:address,:addressNo)

  end
end