FactoryBot.define do
  factory :post do
    association :user

    sequence(:content) { |n| "test#{n}" }
    user_id { user.id }
    
  end
end
