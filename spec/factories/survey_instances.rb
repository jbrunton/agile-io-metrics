FactoryGirl.define do
  factory :survey do
    sequence(:name) { |k| "Survey Instance #{k}" }
    survey_template
  end

end
