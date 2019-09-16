# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Auth API", type: :request do
  let!(:attendant) { create(:attendant) }
  let(:headers) { valid_headers }
  let(:valid_params) do 
    { username: "tolu", password: "test123" }
  end
  let(:invalid_params) do 
    { username: "tola", password: "test" }
  end
  let(:valid_attendant_params) do
    { name: "tolu", username: "toluola7", password: "test123" }.to_json
  end
  
  describe "POST /auth/login"do
    context "when the request is valid" do
      before { post '/auth/login', params: valid_params }
      it "signs in the attendant successfully" do
        expect(json["data"]["token"]).not_to be_nil
        expect(json["message"]).to match(/User logged in Successfully/)
      end

      it "returns ok status code" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the request is invalid" do
      before { post '/auth/login', params: invalid_params }
      it "returns error for attendant signing in" do
        expect(json["message"]).to match(/Invalid credentials/)
      end

      it "returns error status code" do
        expect(response).to have_http_status(401)
      end
    end
  end

  describe "Post /auth/add_attendant" do
    context "when the request is valid" do
      before { post '/auth/add_attendant', params: valid_attendant_params, headers: headers }
      it "create the the attendant successfully" do
        expect(json["data"]["name"]).to eq("tolu")
        expect(json["data"]["username"]).to eq("toluola7")
      end

      it "return a status code of 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when the request is invalid" do
      before { post '/auth/add_attendant', params: {}, headers: headers }
      it "returns an error when creating an attendant" do
        expect(json["status"]).to match(/error/)
        expect(json["message"]).to match(/Validation failed: Password can't be blank, Username should be present, Name should be present, Password digest should be present/)
      end

      it "returns error status code" do
        expect(response).to have_http_status(422)
      end
    end
  end
end