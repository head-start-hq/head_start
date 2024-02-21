FactoryBot.define do
  factory :user do
    first_name { "John" }
    sequence(:email) { |n| "john#{n}@example.com" }
    password { "Tl1JF&pvdJZM6d%6" }
  end
end
