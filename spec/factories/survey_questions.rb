FactoryGirl.define do
  factory :survey_question do
    sequence(:title) { |k| "Question #{k}" }
    text Forgery(:lorem_ipsum).words(12)
    survey_template
  end

end
