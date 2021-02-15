class User < ApplicationRecord
	validates :email, presence: true, format: {with: /[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+/, message: "Need to be a valid email format"}
	# validates :encrypted_password, presence: true
	validates :description, presence: true
	validates :first_name, presence: true, length: {in: 3..15}
	validates :last_name, presence: true
	has_many :attendances
	has_many :events, through: :attendances
	has_many :events
end
