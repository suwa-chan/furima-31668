FactoryBot.define do
  factory :item do
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    name               {"商品"}
    info               {"この商品はvery高いデス。"}
    category_id        {"2"}
    condition_id       {"2"}
    postage_payer_id   {"2"}
    prefecture_id      {"2"}
    handling_time_id   {"2"}
    price              {"100000"}
  end   
end