class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	after_create :welcome_send
	validates :email, presence: true, format: {with: /[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+/, message: "Need to be a valid email format"}
	# validates :encrypted_password, presence: true
	validates :description, presence: true
	validates :first_name, presence: true, length: {in: 3..15}
	validates :last_name, presence: true
	has_many :attendances
	has_many :events, through: :attendances
	has_many :events

	def welcome_send
		UserMailer.welcome_email(self).deliver_now
	end
end
