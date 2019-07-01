require "rails_helper"

RSpec.describe "Product API", type: :request do
  let!(:product) { create_list(:product, 10) }
  let(:product_id) { products.first.id }

  describe "GET /products" do
    before { get "/products" }
    it "returns product" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /products/:id" do
    before { get "/products/#{product_id}" }

    context "when the record exists" do
      it "returns Products" do
        expect(json).not_to be_empty
        expect(json["id"]).to eq(product_id)
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
        expect(response.body).to match(/Couldn't find Todo/)
      end
    end
  end

  describe "POST /products" do
    let(:valid_atrributes) { { name: "tolu", quantity: 2, category: "bags", image: "hhedjn.jpg" } }

    context "when the request is valid" do
      before { post "/products", params: valid_atrributes }
      it "creates a todo" do
        expect(json["name"]).to eq("tolu")
        expect(json["quantity"]).to eq(2)
        expect(json["category"]).to eq("bags")
        expect(json["image"]).to eq("hhedjn.jpg")
      end

      it "returns 201 status" do
        expect(response).to have_http_status(201)
      end
    end

    context "when the request is not valid" do
      before { post "/products", params: { name: "tolu" } }

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "PUT /products/:id" do
    let(:valid_atrributes) { { name: "tolulope"}}
    before { put "/products/#{product_id}"}

    it "updates the record" do
        expect(response.body).to be_empty
    end

    it "returns status code of 204" do
        expect(response).to have_http_status(204)
    end
  end

  describe "DELETE /products/:id" do
    before {delete "/products/#{product_id}"}

    it "returns status code of 204" do
        expect(response).to have_http_status(204)
    end
  end
end
