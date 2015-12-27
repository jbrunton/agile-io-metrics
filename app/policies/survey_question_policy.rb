class SurveyQuestionPolicy < SurveyTemplatePolicy
  def initialize(user, survey_question)
    super(user, survey_question.survey_template)
  end
end