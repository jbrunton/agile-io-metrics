require 'rails_helper'

RSpec.describe "SurveyInstances", type: :request do
  include_context 'authenticated'

  let(:survey_template) { create(:survey_template) }

  before(:each) do
    current_user.add_role :admin, survey_template.organization
  end

  describe "GET /surveys" do
    it "works! (now write some real specs)" do
      get survey_template_surveys_path(survey_template)
      expect(response).to have_http_status(200)
    end
  end
end
