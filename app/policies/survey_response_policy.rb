class SurveyResponsePolicy < ApplicationPolicy
  def create?
    true
  end

  def team?
    show?
  end
end