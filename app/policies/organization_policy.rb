class OrganizationPolicy < ApplicationPolicy
  def show?
    user.has_role?(:admin, record)
  end

  def update?
    user.has_role?(:admin, record)
  end

  def destroy?
    user.has_role?(:admin, record)
  end
end