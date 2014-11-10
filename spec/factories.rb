FactoryGirl.define do

  factory :post do
    sequence(:title) { |n| "Test post #{n}" }
    content "Any not interesting content of the post"
    sequence(:slug) { |n| "test-post-#{n}" }
    hidden false
    published nil
  end

  factory :comment do
    post
    content "This is a comment"
    author "Superman"
  end

  factory :category do
    sequence(:name) { |n| "Category #{n}"}
  end

  factory :user do
    sequence(:login) { |n| "User_#{n}" }
    sequence(:email) { |n| "user_email_#{n}@dev.com" }
    password "password"
    password_confirmation "password"
  end
end
