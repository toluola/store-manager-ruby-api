# frozen_string_literal: true

class UserController < ApplicationController
  include Response
  include ExceptionHandler

  def create
    create_user = Attendant.create!(username: accept_params[:username],
                                    password: accept_params[:password],
                                    name: accept_params[:name])
    json_response(create_user.slice(:id, :name, :username, :created_at, :updated_at),
                  "Attendant created Successfully",
                  :created)
  end

  private

  def accept_params
    params.permit(:username, :password, :name)
  end
end
