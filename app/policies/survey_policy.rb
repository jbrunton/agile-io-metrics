class SurveyPolicy < OrganizationResourcePolicy
  def initialize(user, survey)
    super OrganizationPolicy.new(user, survey.survey_template.organization)
  end

  def show_responses?
    show?
  end

  def show_team_responses?
    show?
  end
end