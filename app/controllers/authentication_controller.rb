# frozen_string_literal: true

class AuthenticationController < ApplicationController
  skip_before_action :authorize_user, only: :authenticate
  include Response
  include ExceptionHandler

  def authenticate
    auth = AuthenticateUser.new(accept_params[:username], accept_params[:password]).call
    json_response({ token: auth }, "User logged in Successfully")
  end

  private

  def accept_params
    params.permit(:username, :password)
  end
end
