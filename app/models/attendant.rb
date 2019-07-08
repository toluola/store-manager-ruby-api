class Attendant < ApplicationRecord
    has_secure_password
    has_many :products, foreign_key: :created_by
    validates :name, :username, :password, presence: { message: "%{value}should be present"}
end
