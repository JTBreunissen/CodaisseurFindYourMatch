User.delete_all

25.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'fake123'
  )
end

User.create!(
  name: 'JT Breunissen',
  email: 'jantjarco@gmail.com',
  password: 'fake123',
  is_admin: true,
)
