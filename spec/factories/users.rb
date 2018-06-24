FactoryBot.define do
  factory :user do
    sequence(:name) {|n| "User#{n}"}
    sequence(:email) {|n| "User#{n}@example.com"}
    password "password"
  end
end
