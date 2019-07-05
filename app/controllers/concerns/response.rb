# frozen_string_literal: true

module Response
  def json_response(object, message, status = :ok)
    render json: { data: object, message: message }, status: status
  end
end
