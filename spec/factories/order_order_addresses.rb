FactoryBot.define do
  factory :order_order_address do
    post_code { '000-0000' }
    pref_id { 26 }
    city { '京都市' }
    address_line1 { '下京区美濃屋町182-10' }
    address_line2 { 'コーポそば102' }
    number { '1234567890' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
