User.delete_all
Course.delete_all

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

# 45.times do
#   Courseday.create!( ["student1", "student2"] )
# end

10.times do
  Course.create!(
    name: Faker::Hipster.sentence(3),
    amount_of_days: rand(25...50)
  )
end
