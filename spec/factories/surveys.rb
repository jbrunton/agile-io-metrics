FactoryGirl.define do
  factory :survey do
    sequence(:name) { |k| "Survey #{k}" }
    description { Forgery(:lorem_ipsum).words(12) }
    organization
  end

end
