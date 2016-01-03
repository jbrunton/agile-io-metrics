class SurveyTemplate < ActiveRecord::Base
  belongs_to :organization
  validates :name, presence: true
  has_many :survey_questions
  has_many :surveys

  def recipients
    organization.teams.map(&:members).flatten.uniq
  end
end
