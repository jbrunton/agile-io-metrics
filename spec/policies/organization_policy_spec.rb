require 'rails_helper'

describe OrganizationPolicy do
  subject { described_class }

  let(:admin_user) { create(:user) }
  let(:another_user) { create(:user) }
  let(:organization) { create(:organization) }

  before(:each) do
    admin_user.add_role :admin, organization
  end

  permissions :show?, :update?, :create? do
    it "denies access if the user doesn't have admin rights" do
      expect(subject).not_to permit(another_user, organization)
    end

    it "grants access if the user has admin rights" do
      expect(subject).to permit(admin_user, organization)
    end
  end
end