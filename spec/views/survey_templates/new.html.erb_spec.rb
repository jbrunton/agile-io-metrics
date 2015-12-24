require 'rails_helper'

RSpec.describe "survey_templates/new", type: :view do
  let(:organization) { create(:organization) }
  let(:survey_template) { build(:survey_template, organization: organization) }

  before(:each) do
    assign(:survey_template, survey_template)
    assign(:record, [organization, survey_template])
  end

  it "renders new survey template form" do
    render

    assert_select "form[action=?][method=?]", organization_survey_templates_path(organization), "post" do

      assert_select "input#survey_template_name[name=?]", "survey_template[name]"

      assert_select "textarea#survey_template_description[name=?]", "survey_template[description]"
    end
  end
end
