class WelcomeController < ApplicationController
  def index
    @employee = current_employee
  end
end
