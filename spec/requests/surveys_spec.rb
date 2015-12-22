require 'rails_helper'

RSpec.describe "Surveys", type: :request do
  describe "GET /organizations/1/surveys" do
    it "works! (now write some real specs)" do
      get organization_surveys_path(create(:organization))
      expect(response).to have_http_status(200)
    end
  end
end
