# frozen_string_literal: true

module Exception_Handler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound
  end
end
