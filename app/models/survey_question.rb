class SurveyQuestion < ActiveRecord::Base
  belongs_to :survey
  validates :text, presence: true
end
