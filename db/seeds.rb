100.times do |n|
  email = Faker::Internet.email
  password = "password"
  User.create!(email: email,
               password: password,
               password_confirmation: password,
               )
end

n = 1
while n <= 100
  Blog.create(
    title: "あああ",
    user_id: n
  )
  n = n + 1
end
