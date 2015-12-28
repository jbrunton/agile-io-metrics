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
    it "allows access to everyone" do
      expect(subject).to permit(user, record)
    end
  end

end