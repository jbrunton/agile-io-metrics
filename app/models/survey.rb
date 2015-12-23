class Survey < ActiveRecord::Base
  belongs_to :organization
  validates :name, presence: true
  has_many :survey_questions
  has_many :survey_instances
end
