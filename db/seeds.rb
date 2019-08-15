# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
if !AdminUser.exists?(:email => 'admin@example.com')
  AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')
end

images = Image.all
Fan.destroy_all
User.destroy_all
Comment.destroy_all
users = []
10.times do
  user = User.new( 
    :name => Faker::Name.name,
    :email => Faker::Internet.email, 
    :password => 'password1', 
    :password_confirmation => 'password1' 
    )
  user.save
  users.push(user)
end

images.each do |image|
  users.each do |user|
    rnd = rand
    image.fans.create(user_id: user.id) if rnd > 0.5
    image.comments.create(title: Faker::Lorem.sentence(word_count: 3),
                          body: Faker::Lorem.sentence(word_count: 15),
                          user_id: user.id) if rnd > 0.8

  end
end

