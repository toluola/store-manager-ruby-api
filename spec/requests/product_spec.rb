# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Product API", type: :request do
  let!(:attendant) { create(:attendant) }
  let!(:product) { create_list(:product, 10) }
  let(:product_id) { product.first.id }
  let(:headers) { valid_headers }

  describe "GET /products" do
    before { get "/products", params: {}, headers: headers }
    it "returns product" do
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /products/:id" do
    before { get "/products/#{product_id}", params: {}, headers: headers }

    context "when the record exists" do
      it "returns Products" do
        expect(json).not_to be_empty
        expect(json["data"]["id"]).to eq(product_id)
      end
      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the record does not exist" do
      let(:product_id) { 100 }
      it "returns 404 status code" do
        expect(response).to have_http_status(404)
      end
      it "returns not found message" do
        expect(json["message"]).to match(/Couldn't find Product with 'id'=100/)
      end
    end
  end

  describe "POST /products" do
    let(:valid_atrributes) do 
      { name: "tolu", quantity: 2, category: "bags", image: "https://hhedjn.com" }.to_json
    end

    context "when the request is valid" do
      before { post "/products", params: valid_atrributes, headers: headers }
      it "creates a product" do
        expect(json["data"]["name"]).to eq("tolu")
        expect(json["data"]["quantity"]).to eq(2)
        expect(json["data"]["image"]).to eq("https://hhedjn.com")
      end

      it "returns 201 status" do
        expect(response).to have_http_status(201)
      end
    end

    context "when the request is not valid" do
      before { post "/products", params: {}, headers: headers }

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "PUT /products/:id" do
    before { put "/products/#{product_id}", params: {}, headers: headers }

    it "returns status code of 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /products/:id" do
    before { delete "/products/#{product_id}", headers: headers }

    it "returns status code of 204" do
      expect(response).to have_http_status(200)
    end
  end
end
