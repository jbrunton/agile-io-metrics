require 'rails_helper'

RSpec.describe "SurveyInstances", type: :request do
  describe "GET /survey_instances" do
    it "works! (now write some real specs)" do
      get survey_instances_path
      expect(response).to have_http_status(200)
    end
  end
end
