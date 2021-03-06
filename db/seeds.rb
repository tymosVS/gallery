# frozen_string_literal: true

unless AdminUser.exists?(email: ENV['ADMIN_EMAIL'])
  AdminUser.create!(email: ENV['ADMIN_EMAIL'],
    password: ENV['ADMIN_PASS'],
    password_confirmation: ENV['ADMIN_PASS'])
end

images = Image.all
Fan.destroy_all
User.destroy_all
Comment.destroy_all
users = []
10.times do
  user = User.new(
                  name: Faker::Name.name,
                  email: Faker::Internet.email,
                  password: 'password1',
                  password_confirmation: 'password1'
                )
  user.save
  users.push(user)
end

images.each do |image|
  users.each do |user|
    rnd = rand
    image.fans.create(user_id: user.id) if rnd > 0.5
    image.comments.create(body: Faker::Lorem.sentence(word_count: 15),
                          user_id: user.id) if rnd > 0.8
  end
end
