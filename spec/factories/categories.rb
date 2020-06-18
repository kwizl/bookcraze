FactoryBot.define do
  factory :category do
    name { 'MyString' }
    priority { 1 }
    article { nil }
  end
end
