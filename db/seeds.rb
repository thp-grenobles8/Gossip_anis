# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
City.destroy_all
User.destroy_all
Gossip.destroy_all
Tag.destroy_all
PrivateMessage.destroy_all

10.times do |index|	
	City.create!(
		name: Faker::Address.city,
		zip_code: Faker::Address.zip_code
	)
end


10.times do |index|
	User.create!(
		first_name: Faker::Name.first_name, 
		last_name: Faker::Name.last_name,
		description: Faker::Lorem.sentence(15), #Un "lorem" de 15 mots.
		email: Faker::Internet.email,
		age: rand(18..50),	
		city: City.all.sample
	)
end


20.times do |index|
	Gossip.create!(
		title: Faker::Book.title,
		content: Faker::Lorem.sentence(15),
		user: User.all.sample
	)
end


10.times do |index|
	Tag.create!(
		title: "##{Faker::Cannabis.buzzword}" #Hashtag avec des buzzwords 
	)
end

20.times do |index|
  	JoinTableGossipTag.create!(  #Lie les gossips et les tags dans un join table (relation N/N)
    	gossip: Gossip.all.sample,
    	tag: Tag.all.sample
    )
end


20.times do |index|
	PrivateMessage.create!(                 #Un sender et un reveiver du DM 
		content: Faker::Lorem.sentence(10),
		sender: User.all.sample,
		recipient: User.all.sample	
	)
end