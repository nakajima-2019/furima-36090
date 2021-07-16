FactoryBot.define do
  factory :item do
    name                {'テスト'}
    description         {'テスト出品です'}
    category_id         {5}
    item_state_id       {4}
    delivery_burden_id  {3}
    delivery_area_id    {6}
    delivery_day_id     {3}
    selling_price       {300}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end


