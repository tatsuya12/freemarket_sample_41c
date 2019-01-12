FactoryBot.define do
  factory :item do
    name "テスト1"
    price "10000"
    status ""
    size "M"
    condition "新品、未使用"
    introduction "商品紹介です"
    brand_id "1"
    category_id "2"
    delivery_id "1"
    buyer_id 1
    seller_id 1
  end
end
