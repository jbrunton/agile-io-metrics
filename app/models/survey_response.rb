class SurveyResponse < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey_instance
  has_many :survey_answers

  accepts_nested_attributes_for :survey_answers
  validates_associated :survey_answers
end
