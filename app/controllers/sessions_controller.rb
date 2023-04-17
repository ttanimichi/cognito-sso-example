class SessionsController < ApplicationController
  skip_before_action :authenticate

  def new
  end

  def create
    email = request.env.dig('omniauth.auth', 'extra', 'raw_info', 'identities').first['userId']
    session[:employee_id] = Employee.find_by!(email:).id
    redirect_to root_url
  end
end
