require 'rails_helper'

RSpec.describe "surveys/new", type: :view do
  let(:organization) { create(:organization) }
  let(:survey) { build(:survey, organization: organization) }

  before(:each) do
    assign(:survey, survey)
    assign(:record, [organization, survey])
  end

  it "renders new survey form" do
    render

    assert_select "form[action=?][method=?]", organization_surveys_path(organization), "post" do

      assert_select "input#survey_name[name=?]", "survey[name]"

      assert_select "textarea#survey_description[name=?]", "survey[description]"
    end
  end
end
