FactoryBot.define do
  factory :order_address do
    Faker::Config.locale = :ja
    postal_code { '111-1111' }
    prefectures_id { 1 }
    city { Faker::Address.state }
    address { Faker::Address.street_address }
    building_name { Faker::Address.building_number }
    phone_number { Faker::Number.number(digits: 11) }
    token { Faker::Internet.password }
  end
end
