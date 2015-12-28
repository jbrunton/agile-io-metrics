class SurveyQuestionPolicy < OrganizationResourcePolicy
  def initialize(user, survey_question)
    super OrganizationPolicy.new(user, survey_question.survey_template.organization)
  end
end