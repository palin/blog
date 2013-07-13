FactoryGirl.define do

  factory :post do
    sequence(:title) { |n| "Test post #{n}" }
    content "Any not interesting content of the post"
    association :category
    sequence(:slug) { |n| "test-post-#{n}" }
    hidden false
    published nil
  end

  factory :category do
    sequence(:name) { |n| "Category #{n}"}
  end
end
