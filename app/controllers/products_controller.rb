# frozen_string_literal: true

class ProductsController < ApplicationController
  include Response
  include Exception_Handler

  def create
    @product = Product.create!(permit_params)
    json_response(@product, "Product created successfully", :created)
  end

  private

  def permit_params
    params.permit(:name, :quantity, {:category => []}, :image)
  end
end
