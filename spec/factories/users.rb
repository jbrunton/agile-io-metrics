FactoryGirl.define do
  factory :user do
    sequence(:email) { |k| "user_#{k}@example.com" }
    password 'Password1'
    password_confirmation { password }
  end
end
