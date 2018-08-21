FactoryBot.define do
  factory :post do
    content "test!"
    post_image "test.jpg"
        
    association :user
  end
end
