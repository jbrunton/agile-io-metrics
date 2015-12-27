class SurveyTemplatePolicy < OrganizationPolicy
  def initialize(user, survey_template)
    super(user, survey_template.organization)
  end

  def trends?
    show?
  end
end