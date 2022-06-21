FactoryBot.define do
  factory :order_order_address do
    post_code {'000-0000'}
    pref_id {26}
    city {"京都市"}
    address_line1 {"下京区美濃屋町182-10"}
    address_line2 {"コーポそば102"}
    number {'09012341234'}
    association :order
    association :user
    association :item
  end
end
