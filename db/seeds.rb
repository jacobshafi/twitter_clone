require 'faker'

10.times do
  new_user = User.create(
    username: Faker::Name.name,
    password: '1234',
    email: Faker::Internet.email
    )
  10.times do
    new_user.tweets << Tweet.create(description: Faker::Hacker.say_something_smart)
  end

end