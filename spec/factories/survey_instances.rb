FactoryGirl.define do
  factory :survey_instance do
    sequence(:name) { |k| "Survey Instance #{k}" }
    survey_template
  end

end
