require 'rails_helper'

RSpec.describe "teams/new", type: :view do
  before(:each) do
    @organization = assign(:organization, create(:organization))
    @team = assign(:team, Team.new(
      :name => "MyString",
      :organization => @organization
    ))
    assign(:record, [@organization, @team])
  end

  it "renders new team form" do
    render

    assert_select "form[action=?][method=?]", organization_teams_path(@organization), "post" do

      assert_select "input#team_name[name=?]", "team[name]"
    end
  end
end
