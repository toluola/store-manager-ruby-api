# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Users API", type: :request do
  let!(:attendant) { create(:attendant) }
  let(:headers) { { "Authorization" => token_generator(attendant.id) } }
  let(:valid_attributes) do
    {
      name: Faker::Internet.name,
      username: Faker::Internet.name,
      password: Faker::Internet.password
    }
  end

  # User signup test suite
  describe "POST /auth/add_attendant" do
    context "when valid request" do
      before { post "/auth/add_attendant", params: valid_attributes, headers: headers }

      it "creates a new user" do
        expect(response).to have_http_status(201)
      end

      it "returns success message" do
        expect(json["message"]).to match(/Attendant created successfully/)
      end
    end

    context "when invalid request" do
      before { post "/auth/add_attendant", params: {}, headers: headers }

      it "does not create a new user" do
        expect(response).to have_http_status(422)
      end

      it "returns failure message" do
        expect(json["message"]).
          to match(/Validation failed: Password can't be blank, Username should be present, Name should be present, Password digest should be present/)
      end
    end
  end
end
