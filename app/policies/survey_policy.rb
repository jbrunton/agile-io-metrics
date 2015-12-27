class SurveyPolicy < SurveyTemplatePolicy
  def initialize(user, survey)
    super(user, survey.survey_template)
  end
end