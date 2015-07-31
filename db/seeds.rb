require 'faker'

10.times do
  User.create(
    username: Faker::Name.name,
    password: '1234',
    email: Faker::Internet.email
    )

end