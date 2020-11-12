FactoryBot.define do
  factory :user do
    nickname              {"kurage"}
    email                 {Faker::Internet.free_email}
    password              {"a000000"}
    password_confirmation {"a000000"}
    last_name             {"山田"}
    first_name            {"太郎"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birth_date            {"1996-04-05"}
  end
end