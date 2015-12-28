require 'rails_helper'

RSpec.describe "Teams", type: :request do
  include_context 'authenticated'

  let(:organization) { create(:organization) }

  before(:each) do
    current_user.add_role :admin, organization
  end

  describe "GET /teams" do
    it "works! (now write some real specs)" do
      get organization_teams_path(organization)
      expect(response).to have_http_status(200)
    end
  end
end
