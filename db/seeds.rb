# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.all.destroy_all
10.times do
	first_name = Faker::GreekPhilosophers.name
	User.create(email: "#{first_name}@yopmail.com", password: "password", first_name: first_name, last_name: Faker::Name.last_name, description:"...")
end
10.times do
	Event.create(user: User.all.sample, start_date: Faker::Date.between(from: Date.today, to: 1.year.from_now), duration: (0..200).step(5).to_a.sample, title: Faker::GreekPhilosophers.quote ,description: Faker::Lorem.paragraph_by_chars(number: rand(20..1000), supplemental: false) ,price: rand(1..1000), location: Faker::Address.city )
end
20.times do
	Attendance.create(user: User.all.sample, event: Event.all.sample)
end