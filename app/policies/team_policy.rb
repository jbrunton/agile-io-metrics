class TeamPolicy < ApplicationPolicy
  def show?
    user.member_of?(record) || user.admin_of?(record)
  end

  def update?
    user.admin_of?(record)
  end

  def destroy?
    update?
  end
end