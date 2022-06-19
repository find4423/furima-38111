FactoryBot.define do
  factory :item do
    name { 'そば' }
    explanation { 'そばです。' }
    category_id { 2 }
    condition_id { 2 }
    shipping_charge_id { 2 }
    pref_id { 2 }
    delivery_id { 2 }
    price { 600 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
