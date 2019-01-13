FactoryBot.define do
  factory :brand do
    name 'nike'
    created_at Faker::Time.between(2.days.ago, Date.today, :all)
    updated_at Faker::Time.between(2.days.ago, Date.today, :all)
  end
end
