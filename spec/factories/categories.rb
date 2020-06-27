FactoryBot.define do
  factory :category do
    name { 'Tech' }
    priority { 1 }
    article { nil }
  end
end
