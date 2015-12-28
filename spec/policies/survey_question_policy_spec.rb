require 'rails_helper'

describe SurveyQuestionPolicy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:organization) { create(:organization) }
  let(:team) { create(:team, organization: organization) }
  let(:survey_template) { create(:survey_template, organization: organization) }
  let(:record) { create(:survey_question, survey_template: survey_template) }

  it_behaves_like 'OrganizationResourcePolicy'


end