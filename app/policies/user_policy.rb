class UserPolicy < ApplicationPolicy
  def show?
    record.id == user.try(:id)
  end
end