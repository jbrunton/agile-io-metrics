require 'rails_helper'

describe UserPolicy do
  subject { described_class }

  let(:current_user) { create(:user) }
  let(:another_user) { create(:user) }

  permissions :show? do
    it "denies access if the user isn't the current user" do
      expect(subject).not_to permit(current_user, another_user)
    end

    it "grants access if the user is the current user" do
      expect(subject).to permit(current_user, current_user)
    end
  end
end