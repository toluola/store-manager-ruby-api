# frozen_string_literal: true

module Exception_Handler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      error_json_response(e.message, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      error_json_response(e.message, :unprocessable_entity)
    end
  end
end
