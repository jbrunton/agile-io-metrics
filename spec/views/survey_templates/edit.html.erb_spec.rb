require 'rails_helper'

RSpec.describe "survey_templates/edit", type: :view do
  let(:organization) { create(:organization) }
  let(:survey_template) { create(:survey_template, organization: organization) }

  before(:each) do
    assign(:survey_template, survey_template)
    assign(:record, survey_template)
  end

  it "renders the edit survey form" do
    render

    assert_select "form[action=?][method=?]", survey_template_path(survey_template), "post" do

      assert_select "input#survey_template_name[name=?]", "survey_template[name]"

      assert_select "textarea#survey_template_description[name=?]", "survey_template[description]"
    end
  end
end
