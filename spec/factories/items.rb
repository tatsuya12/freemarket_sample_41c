FactoryBot.define do
  factory :item do
    name "テスト1"
    price "10000"
    status ""
    size "M"
    condition "新品、未使用"
    introduction "商品紹介です"
    created_at 1.day.ago
    updated_at 1.day.ago
  end
end
