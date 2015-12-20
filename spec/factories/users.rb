FactoryGirl.define do
  factory :user do
    sequence(:email) { |k| "user_#{k}@example.com" }
  end
end
