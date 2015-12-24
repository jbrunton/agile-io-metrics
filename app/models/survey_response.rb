class SurveyResponse < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey_instance
  has_many :survey_answers

  accepts_nested_attributes_for :survey_answers
  validates_associated :survey_answers

  def self.build_for(survey_instance, user)
    survey_response = survey_instance.survey_responses.build(user_id: user.id)
    survey_response.survey_instance.survey_template.survey_questions.each do |question|
      survey_response.survey_answers.build(survey_question: question)
    end
    survey_response
  end

  def self.build_from(survey_instance, survey_response_params, user)
    survey_instance.survey_responses.build(survey_response_params.merge(user_id: user.id))
  end

  def answer_for(question)
    survey_answers.find_by(survey_question_id: question.id)
  end
end
