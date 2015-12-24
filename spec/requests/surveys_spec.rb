require 'rails_helper'

RSpec.describe "SurveyInstances", type: :request do
  describe "GET /surveys" do
    it "works! (now write some real specs)" do
      get survey_template_surveys_path(create(:survey_template))
      expect(response).to have_http_status(200)
    end
  end
end
