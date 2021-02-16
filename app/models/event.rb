class Event < ApplicationRecord
	validates :start_date, presence: true
	validates :duration, presence: true
	validates :title, length: {in: 5..140}
	validates :description, length: {in: 20..1000}
	validates :price, numericality: {greater_than: 0, less_than_or_equal_to: 1000}
	validates :location, presence: true
	validate :past_date
	validate :duration_validation
	belongs_to :user
	has_many :attendances, dependent: :destroy
	has_many :users, through: :attendances

	def past_date
		begin
			errors.add(:start_date, "La date doit être dans le futur") if start_date < DateTime.now
		rescue NoMethodError
			errors.add(:start_date, "Pas de date")
		end
	end

	def duration_validation
		begin
			errors.add(:duration, "La durée doit être positive") if duration <= 0
			errors.add(:duration, "La durée doit être un multiple de 5") unless duration % 5 == 0
		rescue NoMethodError
			errors.add(:duration, "Pas de durée")
		end
	end

end
