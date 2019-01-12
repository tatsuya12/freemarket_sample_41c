FactoryBot.define do
  factory :delivery do
    shippin_change "送料込み（出品者負担）"
    origin_region "広島県"
    shipping_method "普通郵便（定型、定形外）"
  end
end
