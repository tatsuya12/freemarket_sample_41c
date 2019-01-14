FactoryBot.define do
  factory :delivery do
    shipping_charge "送料込み（出品者負担）"
    origin_region "広島県"
    shipping_method "普通郵便（定型、定形外）"
    shipping_days "２〜3日で発送"
  end
end
