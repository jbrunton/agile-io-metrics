class Survey < ActiveRecord::Base
  belongs_to :organization
  validates :name, presence: true
  has_many :survey_questions
end
