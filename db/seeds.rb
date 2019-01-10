# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "テスト１", email: "test@gmail.com", password: "password")

Item.create(name: "アイテム１", price: "15000", status: "", size: "M", condition: "新品、未使用", introduction: "テスト商品紹介")
