class SurveyQuestion < ActiveRecord::Base
  belongs_to :survey_template
  validates :title, presence: true
end
