require 'rails_helper'

describe SurveyTemplatePolicy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:organization) { create(:organization) }
  let(:team) { create(:team, organization: organization) }
  let(:record) { create(:survey_template, organization: organization) }

  it_behaves_like 'OrganizationResourcePolicy', {
    extra_read_actions: [:trends?, :show_surveys?]
  }
end