# frozen_string_literal: true

class AuthenticateUser
  def initialize(username, password)
    @username = username
    @password = password
  end

  def call
    JsonWebToken.encode({user_id: user.id, role: user.role}) if user
  end

  private

  attr_reader :username, :password
  def user
    user = Attendant.find_by(username: username)
    return user if user && user.authenticate(password)
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
