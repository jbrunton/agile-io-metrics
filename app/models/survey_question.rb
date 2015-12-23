class SurveyQuestion < ActiveRecord::Base
  belongs_to :survey
  validates :title, presence: true
end
