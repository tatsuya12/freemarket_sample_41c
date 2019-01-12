FactoryBot.define do
  factory :item do
  	name              "abe"
    price              "100"
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end
