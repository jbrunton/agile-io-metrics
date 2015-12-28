require 'rails_helper'

describe SurveyPolicy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:organization) { create(:organization) }
  let(:team) { create(:team, organization: organization) }
  let(:survey_template) { create(:survey_template, organization: organization) }
  let(:survey) { create(:survey, survey_template: survey_template) }

  permissions :show?, :show_responses?, :show_team_responses? do
    it "denies access if the user isn't a member" do
      expect(subject).not_to permit(user, survey)
    end

    it "allows access if the user is an org admin" do
      user.add_role(:admin, organization)
      expect(subject).to permit(user, survey)
    end

    it "allows access if the user is a member" do
      user.add_role(:member, team)
      expect(subject).to permit(user, survey)
    end
  end

  permissions :new?, :create?, :edit?, :update?, :destroy? do
    it "denies access if the user isn't a member" do
      expect(subject).not_to permit(user, survey)
    end

    it "denies access if the user isn't an org admin" do
      user.add_role(:member, team)
      user.add_role(:admin, team)

      expect(subject).not_to permit(user, survey)
    end

    it "grants access if the user is an org admin" do
      user.add_role(:admin, organization)
      expect(subject).to permit(user, survey)
    end
  end
end