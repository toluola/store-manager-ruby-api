# frozen_string_literal: true

class UserController < ApplicationController
  before_action :check_admin
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

  def check_admin
    if current_user.role != "admin"
      error_json_response("you are not authorized to perform this operation", :unauthorized)
    end
  end
end
