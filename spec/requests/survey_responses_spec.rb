require 'rails_helper'

RSpec.describe "SurveyResponses", type: :request do
  describe "GET /survey_instances/1/survey_responses" do
    it "works! (now write some real specs)" do
      get survey_instance_survey_responses_path(create(:survey_instance))
      expect(response).to have_http_status(200)
    end
  end
end
