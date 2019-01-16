# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

metal, jazz = Category.create([{name: "metal"}, {name: "jazz"}])

melodic, black = metal.children.create([{name: "melodic"}, {name: "black"}])
melodic.children.create([{name: "melodic-death"}, {name: "melodic-speed"}])
black.children.create([{name: "symphonic-black"}, {name: "melodic-black"}])

swing, modern = jazz.children.create([{name: "swing"}, {name: "modern"}])






5.times do |i|
  User.create(name: "テスト#{i}", email: "test#{i}@gmail.com", password: "password#{i}")
  Brand.create(name: "ブランド#{i}")
  Item.create!(name: "アイテム#{i}", price: "100", status: "", size: "M", condition: "新品、未使用", introduction: "テスト商品紹介", brand_id: 1, category_id: 1, seller_id: 2, buyer_id: 1)
  Delivery.create(shipping_charge: 100, origin_region: "発送場所", shipping_days: 3, shipping_method: "配送方法", item_id: "#{i}")
end


100.times do |number|
  Image.create(image: "https://static-mercari-jp-imgtr2.akamaized.net/thumb/photos/m68416746432_1.jpg?1545554718", item_id: "#{number}")
end
