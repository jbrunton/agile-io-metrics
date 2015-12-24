require 'rails_helper'

RSpec.describe "SurveyTemplatess", type: :request do
  describe "GET /organizations/1/survey_templats" do
    it "works! (now write some real specs)" do
      get organization_survey_templates_path(create(:organization))
      expect(response).to have_http_status(200)
    end
  end
end
