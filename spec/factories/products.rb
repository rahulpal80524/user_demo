FactoryBot.define do
  factory :product do
    name { "MyString" }
    description { "MyText" }
    price { 1.5 }
    user { nil }
  end
end
