# frozen_string_literal: true

require "rails_helper"

RSpec.describe Attendant, type: :model do
  describe "Associations" do
    it { should have_many(:products) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:name) }
  end
end
