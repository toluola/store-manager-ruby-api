# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :fetch_products, only: %i(show destroy update)
  include Response
  include ExceptionHandler

  def create
    @product = current_user.products.create!(permit_params)
    json_response(@product, "Product created successfully", :created)
  end

  def index
    @product = Product.all
    json_response(@product, "Products Fetched Successfully")
  end

  def show
    json_response(@product, "Product Fetched Successfully")
  end

  def destroy
    @product.destroy
    json_response(@product, "Product Deleted Successfully")
  end

  def update
    @product.update(permit_params)
    json_response(@product, "Product Updated Successfully")
  end

  private

  def permit_params
    params.permit(:name, :quantity, { category: [] }, :image)
  end

  def fetch_products
    @product = Product.find(params[:id])
  end
end
