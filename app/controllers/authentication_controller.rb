class AuthenticationController < ApplicationController
    def Authenticate
        auth = AuthenticateUser.new(username: accept_params[:username], password: params[:password]).call
        json_response(token: auth, "User logged Successfully")
    end

    private
    def accept_params
        params.permit(:username, :password)
    end
end 
