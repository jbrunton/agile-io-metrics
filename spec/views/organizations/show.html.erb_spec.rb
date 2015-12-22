require 'rails_helper'

RSpec.describe "organizations/show", type: :view do
  before(:each) do
    @organization = assign(:organization, create(:organization))
    @team = create(:team, organization: @organization)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@organization.name}/)
    expect(rendered).to match(/#{@team.name}/)
  end
end
