RSpec.shared_examples 'OrganizationResourcePolicy' do |options|

  permissions :show?, *(options[:extra_read_actions] || []) do
    it "denies access if the user isn't a member" do
      expect(subject).not_to permit(user, record)
    end

    it "allows access if the user is an org admin" do
      user.add_role(:admin, organization)
      expect(subject).to permit(user, record)
    end

    it "allows access if the user is a member" do
      user.add_role(:member, team)
      expect(subject).to permit(user, record)
    end
  end

  permissions :new?, :edit?, :update?, :create?, :destroy?, *(options[:extra_write_actions] || []) do
    it "denies access if the user isn't a member" do
      expect(subject).not_to permit(user, record)
    end

    it "denies access if the user isn't an org admin" do
      user.add_role(:member, team)
      user.add_role(:admin, team)

      expect(subject).not_to permit(user, record)
    end

    it "grants access if the user is an org admin" do
      user.add_role(:admin, organization)
      expect(subject).to permit(user, record)
    end
  end
end