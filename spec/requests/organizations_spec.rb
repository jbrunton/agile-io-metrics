require 'rails_helper'

RSpec.describe "Organizations", type: :request do
  let(:current_user) { create(:user) }

  before do
    login_as current_user
  end

  describe "GET /organizations" do
    it "works! (now write some real specs)" do
      get organizations_path
      expect(response).to have_http_status(200)
    end
  end
end
