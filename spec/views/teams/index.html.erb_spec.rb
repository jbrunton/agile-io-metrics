require 'rails_helper'

RSpec.describe "teams/index", type: :view do
  before(:each) do
    organization = assign(:organization, create(:organization))
    @teams = assign(:teams, [
        create(:team, organization: organization),
        create(:team, organization: organization)
    ])
  end

  it "renders a list of teams" do
    render
    assert_select "tr>td", :text => @teams[0].name
    assert_select "tr>td", :text => @teams[1].name
  end
end
