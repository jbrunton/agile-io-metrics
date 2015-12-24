class SurveyAnswer < ActiveRecord::Base
  belongs_to :survey_response
  belongs_to :survey_question
  belongs_to :mood
  validates :mood_id, presence: true
end
