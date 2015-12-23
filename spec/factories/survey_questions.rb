FactoryGirl.define do
  factory :survey_question do
    text Forgery(:lorem_ipsum).words(12)
    survey
  end

end
