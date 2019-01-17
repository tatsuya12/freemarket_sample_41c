FactoryBot.define do
  factory :item do
    name "テスト1"
    price 10000
    status "出品中"
    size "M"
    condition "新品、未使用"
    introduction "商品紹介です"
    shipping_charge "送料込み"
    origin_region "広島県"
    shipping_method "普通郵便"
    shipping_days "2〜3日で発送"
    created_at { Faker::Time.between(10.days.ago, Time.now, :all) }
    updated_at { Faker::Time.between(5.days.ago, Time.now, :all) }
    brand_id        1
    category_id     3
  end
end
