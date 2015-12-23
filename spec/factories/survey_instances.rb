FactoryGirl.define do
  factory :survey_instance do
    sequence(:name) { |k| "Survey Instance #{k}" }
    survey
  end

end
