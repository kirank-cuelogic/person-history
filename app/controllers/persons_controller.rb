class PersonsController < ApplicationController
  def index
    @persons = Person.all
    # binding.pry
    render json: @persons, status: 200
  end
end