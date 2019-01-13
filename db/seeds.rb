# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "テスト１", email: "test@gmail.com", password: "password")
Item.create(name: "アイテム１", price: "15000", status: "", size: "M", condition: "新品、未使用", introduction: "テスト商品紹介")


100.times do |number|
  Image.create(image: "https://static-mercari-jp-imgtr2.akamaized.net/thumb/photos/m68416746432_1.jpg?1545554718", item_id: "#{number}")
end

metal, jazz = Category.create([{name: "metal"}, {name: "jazz"}])

melodic, black = metal.children.create([{name: "melodic"}, {name: "black"}])
melodic.children.create([{name: "melodic-death"}, {name: "melodic-speed"}])
black.children.create([{name: "symphonic-black"}, {name: "melodic-black"}])

swing, modern = jazz.children.create([{name: "swing"}, {name: "modern"}])
