FactoryBot.define do
  factory :article do
    user { nil }
    title { "MyText" }
    text { "MyText" }
    image { "MyString" }
  end
end
