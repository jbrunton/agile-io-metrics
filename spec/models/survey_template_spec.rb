require 'rails_helper'

RSpec.describe SurveyTemplate, type: :model do
  describe "#recipients" do
    let!(:organization) { create(:organization) }
    let!(:team) { create(:team, organization: organization) }
    let!(:user) { create(:user) }
    let!(:survey_template) { create(:survey_template, organization: organization) }

    before(:each) { user.add_role :member, team }

    it "lists the intended recpients of the survey" do
      expect(survey_template.recipients).to eq([user])
    end

    it "de-dupes the list of recipients" do
      other_team = create(:team, organization: organization)
      user.add_role :member, other_team
      expect(survey_template.recipients).to eq([user])
    end
  end
end
