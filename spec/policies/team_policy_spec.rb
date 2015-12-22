require 'rails_helper'

describe TeamPolicy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:organization) { create(:organization) }
  let(:team) { create(:team, organization: organization) }

  permissions :show? do
    it "denies access if the user isn't a member" do
      expect(subject).not_to permit(user, team)
    end

    it "allows access if the user is an admin" do
      user.add_role(:admin, team)
      expect(subject).to permit(user, team)
    end

    it "allows access if the user is a member" do
      user.add_role(:member, team)
      expect(subject).to permit(user, team)
    end
  end

  permissions :update?, :destroy? do
    it "denies access if the user isn't a member" do
      expect(subject).not_to permit(user, team)
    end

    it "denies access if the user isn't an admin" do
      user.add_role(:member, team)
      expect(subject).not_to permit(user, team)
    end

    it "grants access if the user is an org admin" do
      user.add_role(:admin, team)
      expect(subject).to permit(user, team)
    end
  end
end