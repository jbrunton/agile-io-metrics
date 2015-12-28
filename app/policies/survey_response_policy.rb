# Authorization policy for {SurveyResponse}.
class SurveyResponsePolicy < ApplicationPolicy
  def create?
    true
  end
end
