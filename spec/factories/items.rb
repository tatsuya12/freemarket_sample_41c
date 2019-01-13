FactoryBot.define do
  factory :item do
    name "商品"
    price "15000"
    status "売り切れ"
    size "M"
    condition "新品、未使用"
    introduction "イントロダクション"
    created_at Faker::Time.between(2.days.ago, Date.today, :all)
    updated_at Faker::Time.between(2.days.ago, Date.today, :all)
  end
end
