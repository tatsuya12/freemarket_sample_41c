FactoryBot.define do

  factory :category do
    name 'black'
    ancestry '1'
    created_at Faker::Time.between(2.days.ago, Date.today, :all)
    updated_at Faker::Time.between(2.days.ago, Date.today, :all)
  end
end
