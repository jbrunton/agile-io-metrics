# Authorization policy for {SurveyResponse}.
class SurveyResponsePolicy < ApplicationPolicy
  def create?
    record.survey.survey_template.recipients.include?(user)
  end
end
