# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(
  user_name: "a",
  email: "a@gmail.com",
  name: "中川くん",
  address: "東京都",
  password: 'aaaaaa'
)

User.create(
  user_name: "b",
  email: "b@gmail.com",
  name: "中川くん",
  address: "東京都",
  password: 'bbbbbb'
)


50.times do |i|
  Product.create(
    id: i,
    user_id: 2,
    name: "オーブントースター",
    details: "",
    price: 1000,
    condition: "新品、未使用",
    status: "waiting"
  )

  ProductImage.create(
    product_id: i,
    image:  open("./app/assets/images/no_image.png"),
    order_number: 1
  )
end