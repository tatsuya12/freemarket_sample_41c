# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



ladies, mens = Category.create([{name: "レディース"}, {name: "メンズ"}])

tops, pants = ladies.children.create([{name: "トップス"}, {name: "パンツ"}])

tops.children.create([{name:"Tシャツ"}, {name: "ポロシャツ"}])
pants.children.create([{name: "デニム"}, {name: "ワークパンツ"}])


shoes, bags = mens.children.create([{name: "靴"}, {name: "バッグ"}])

shoes.children.create([{name:"スニーカー"}, {name: "サンダル"}])
bags.children.create([{name: "ショルダーバッグ"}, {name: "トートバッグ"}])

