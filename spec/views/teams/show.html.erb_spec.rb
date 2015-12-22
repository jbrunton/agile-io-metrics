require 'rails_helper'

RSpec.describe "teams/show", type: :view do
  let(:organization) { create(:organization) }

  before(:each) do
    @team = assign(:team, Team.create!(
      :name => "Name",
      :organization => organization
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/#{organization.name}/)
  end
end
