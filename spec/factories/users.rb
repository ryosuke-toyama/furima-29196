FactoryBot.define do
  factory :user do
    Faker::Config.locale = :ja
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    family_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    family_name_kana { 'セイ' }
    first_name_kana { 'メイ' }
    birthday { Faker::Date.between(from: '1935-01-01', to: '2005-01-01') }
  end
end
