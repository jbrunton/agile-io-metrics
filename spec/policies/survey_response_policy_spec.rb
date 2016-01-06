require 'rails_helper'

describe SurveyResponsePolicy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:organization) { create(:organization) }
  let(:team) { create(:team, organization: organization) }
  let(:survey_template) { create(:survey_template, organization: organization) }
  let(:survey) { create(:survey, survey_template: survey_template) }
  let(:record) { create(:survey_response, survey: survey) }

  permissions :new?, :create? do
    it "allows access to team members" do
      user.add_role :member, team
      expect(subject).to permit(user, record)
    end

    it "disallows access to admins" do
      user.add_role :admin, team
      expect(subject).not_to permit(user, record)
    end

    it "disallows access to everyone else" do
      expect(subject).not_to permit(user, record)
    end
  end

end