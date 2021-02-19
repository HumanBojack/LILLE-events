class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	after_create :welcome_send
	after_create :random_avatar
	validates :email, uniqueness: true, presence: true, format: {with: /[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+/, message: "Need to be a valid email format"}
	validates :encrypted_password, presence: true
	validates :description, presence: true
	validates :first_name, presence: true, length: {in: 3..15}
	validates :last_name, presence: true
	has_many :attendances, dependent: :destroy
	has_many :events, through: :attendances
	has_many :events, dependent: :destroy
	has_one_attached :avatar

	def welcome_send
		UserMailer.welcome_email(self).deliver_now
	end

	def random_avatar
		url = URI.parse(Faker::LoremFlickr.image(size: "300x300"))
		filename = url.path
		file = URI.open(url)
		self.avatar.attach(io: file, filename: filename)
	end

	def thumbnail
		return self.avatar.variant(resize: "300x300!")
	end

	def not_guest_nor_admin?(event)
		if Attendance.find_by(user: self, event: event) || event.user == self
			return false
		else
			return true
		end
	end

	def is_admin?(event)
		event.user == self
	end

	def is_global_admin?
		self.is_admin == true
	end
end
