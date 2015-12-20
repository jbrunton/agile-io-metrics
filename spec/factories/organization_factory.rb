FactoryGirl.define do
  factory :organization do
    sequence(:name) { |k| "Organization #{k}" }
  end
end