# Authorization policy for {SurveyQuestion}.
class SurveyQuestionPolicy < OrganizationResourcePolicy
  def initialize(user, survey_question)
    organization = survey_question.survey_template.organization
    super OrganizationPolicy.new(user, organization)
  end
end
