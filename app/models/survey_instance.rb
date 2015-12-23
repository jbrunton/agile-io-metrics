class SurveyInstance < ActiveRecord::Base
  belongs_to :survey
  has_many :survey_responses
  validates :name, presence: true
end
