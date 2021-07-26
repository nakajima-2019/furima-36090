FactoryBot.define do
  factory :order_address do
    postal_code         { "123-4567" }
    delivery_area_id    { 6 }
    city                { "バビロン" }
    block               { "バビロン" }
    building            { "バビロン" }
    phone_number        { "0901234567" }

    association :user
    association :item
  end
end
