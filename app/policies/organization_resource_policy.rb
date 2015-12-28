class OrganizationResourcePolicy
  def initialize(organization_policy)
    @organization_policy = organization_policy
  end

  def show?
    @organization_policy.show?
  end

  def new?
    @organization_policy.update?
  end

  def edit?
    @organization_policy.update?
  end

  def update?
    @organization_policy.update?
  end

  def create?
    @organization_policy.update?
  end

  def destroy?
    @organization_policy.update?
  end
end