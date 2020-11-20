FactoryBot.define do
  factory :purchase_address do
    token              {'tok_1234567890abcdefghijk'}
    postal_code        {"123-4567"}
    prefecture_id      {"2"}
    city               {"かほく市"}
    address            {"宇野気26-3"}
    building           {"山崎ハイツ102"}
    phone_number       {"11111111111"}
  end
end
