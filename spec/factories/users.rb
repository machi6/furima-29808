FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 8)
    password { password }
    password_confirmation { password }
    Faker::Config.locale = 'ja'
    birth_day { Faker::Date.in_date_period }
    first_name { Faker::Name.first_name }
    family_name { Faker::Name.last_name }
    first_name_kana { Faker::Base.regexify('ヤマダ') }
    family_name_kana { Faker::Base.regexify('タロウ') }
  end
end
