class WelcomeController < ApplicationController
  def index
    @employees = Employee.all
    @vacancies = Vacancy.all
  end
end