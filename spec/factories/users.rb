FactoryBot.define do
  factory :user do
    nickname {"ニック"}
    email  {Faker::Internet.free_email}
    password {"aaa4423"}
    password_confirmation {password}
    last_name {"あ缶デ"}
    first_name {"あ感デ"}
    last_name_kana {"アカンデ"}
    first_name_kana {"アカンデ"}
    birth_day {"2000-10-10"}
  end
end
