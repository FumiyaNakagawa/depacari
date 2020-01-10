# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(
  user_name: "depacari",
  email: "depacari@example.com",
  name: "デパカリ太郎",
  address: "東京都",
  password: 'aaaaaa'
)



30.times do |i|
  p = Product.create(
    user_id: 1,
    name: "ご飯",
    details: "美味しいご飯です",
    price: 1000,
    condition: "新品、未使用",
    status: "waiting"
  )

  ProductImage.create(
    product_id: p.id,
    image:  open("./app/assets/images/rice.png"),
    order_number: 1
  )
end