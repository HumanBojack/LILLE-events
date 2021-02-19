class UserMailer < ApplicationMailer
	def welcome_email(user)
		@user = user
		mail(to: @user.email, subject: "Bienvenue chez nous !")
	end

	def attendance_email(attendance)
		@attendance = attendance
		mail(to: @attendance.event.user.email, subject: "Votre évènement: #{@attendance.event.title}")
	end

	def validated_email(event)
		@event = event
		mail(to: event.user.email, subject: "Votre évènement est validé !")
	end
end
