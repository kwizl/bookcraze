FactoryBot.define do
  factory :article do
    user { nil }
    title { 'MyText' }
    text { 'MyText' }
  end
end
