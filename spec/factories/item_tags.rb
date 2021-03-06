FactoryBot.define do
  factory :item_tag do
    Faker::Config.locale = :ja
    name { Faker::Name.name }
    message { Faker::Lorem.sentence }
    price { 3000 }
    category_id { 1 }
    sales_status_id { 1 }
    shipping_fee_id { 1 }
    prefecture_id { 1 }
    scheduled_delively_id { 1 }
    tag_name { Faker::Lorem.sentence }
  end
end
