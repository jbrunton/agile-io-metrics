FactoryGirl.define do
  factory :team do
    sequence(:name) { |k| "Team #{k}" }
    organization
  end

end
