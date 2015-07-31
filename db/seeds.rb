require 'faker'

10.times do
  User.create(
    username: Faker::Name.name,
    password: '1234',
    email: Faker::Internet.email
    )

10.times do
  Tweet.create {
    user_id

  }

end