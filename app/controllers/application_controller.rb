class ApplicationController < ActionController::Base
  before_action :authenticate

  def authenticate
    redirect_to sessions_new_url unless current_employee
  end

  def current_employee
    @current_employee ||= Employee.find_by(id: session[:employee_id])
  end
end
