class Attendance < ApplicationRecord
	after_create :attendance_email
	belongs_to :user
	belongs_to :event

	def attendance_email
		UserMailer.attendance_email(self).deliver_now
	end
end
