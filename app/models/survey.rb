class Survey < ActiveRecord::Base
  belongs_to :survey_template
  has_many :survey_responses
  has_many :survey_answers, through: :survey_responses
  validates :name, presence: true

  def analyze
    answers_by_question = survey_answers.group_by { |answer| answer.survey_question }
    ratings_by_question = answers_by_question.map do |question, answers|
      [question, answers.map{ |answer| answer.try(:mood).try(:weight) }.compact]
    end.to_h
    ratings_by_question.map do |question, ratings|
      [question, ratings.reduce(:+) / ratings.length]
    end.to_h
  end
end
