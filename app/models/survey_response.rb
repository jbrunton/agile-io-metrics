class SurveyResponse < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey_instance
end
