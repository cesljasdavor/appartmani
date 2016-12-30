class PersonsController < ApplicationController

  def create
    @person = Person.create(person_params)

    if @person.save
      respond_to do |format|
        format.json
      end
    end
  end

  def show
    @person = Person.find(params[:id])
    respond_to do |format|
      format.json {render :show}
    end
  end

  private
  def person_params
    debugger
    params.require(:person)
  end
end