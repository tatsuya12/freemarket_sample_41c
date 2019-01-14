FactoryBot.define do
  factory :item do
    name "テスト1"
    price 10000
    status "出品中"
    size "M"
    condition "新品、未使用"
    introduction "商品紹介です"
    created_at { Faker::Time.between(10.days.ago, Time.now, :all) }
    updated_at { Faker::Time.between(5.days.ago, Time.now, :all) }
  end
end
