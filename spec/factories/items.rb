FactoryBot.define do
  factory :item do
  	name "abe"
    price "100"
    status "出品中"
    size "M"
    condition "新品"
    introduction "サイズが合わないので出品します"
    created_at { Faker::Time.between(10.days.ago, Time.now, :all) }
    updated_at { Faker::Time.between(5.days.ago, Time.now, :all) }
    brand_id 1
    category_id 1
    buyer_id 1
    seller_id 1
  end
end
