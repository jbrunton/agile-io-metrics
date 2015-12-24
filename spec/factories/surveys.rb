FactoryGirl.define do
  factory :survey do
    sequence(:name) { |k| "Survey #{k}" }
    survey_template
  end

end
