class UserPolicy < ApplicationPolicy
  def show?
    user.try(:id) == record.id ||
      !(user.organizations & record.organizations).empty?
  end
end