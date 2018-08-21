FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    email "#{:name}@example.com"
    email_confirmation "#{:name}@example.com" 
    password "#{:name}2018"
    password_confirmation "#{:name}2018"
  end
end
