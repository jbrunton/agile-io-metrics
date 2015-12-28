require 'rails_helper'

RSpec.describe "Organizations", type: :request do
  include_context 'authenticated'

  let(:organization) { create(:organization) }

  before do
    current_user.add_role :admin, organization
  end

  describe "GET /organization/1" do
    it "works! (now write some real specs)" do
      get organization_path(organization)
      expect(response).to have_http_status(200)
    end
  end
end
