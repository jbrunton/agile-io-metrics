class Survey < ActiveRecord::Base
  belongs_to :survey_template
  has_many :survey_responses
  has_many :survey_answers, through: :survey_responses
  validates :name, presence: true

  RELATIONS_FOR_REPORTS = [
    :user,
    survey_answers: [
      :mood,
      :survey_response
    ]
  ]

  def rating_for(question, team = nil)
    # TODO: unit tests
    answers = survey_answers.where(survey_question_id: question.id).select do |answer|
      team.nil? || answer.survey_response.user.member_of?(team)
    end

    ratings = answers.map do |answer|
      answer.try(:mood).try(:weight)
    end.compact

    ratings.reduce(:+) / ratings.length
  end


  def responses_for(team)
    # TODO: unit tests
    survey_responses.includes(RELATIONS_FOR_REPORTS).select do |response|
      response.user.member_of?(team)
    end
  end

  def teams
    # TODO: unit tests
    survey_responses.map{ |response| response.user.teams(:member) }.flatten.uniq
  end
end
