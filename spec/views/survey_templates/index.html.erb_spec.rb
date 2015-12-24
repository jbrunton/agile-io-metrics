require 'rails_helper'

RSpec.describe "survey_templates/index", type: :view do
  let(:organization) { create(:organization) }
  let(:survey_templates) {[
      create(:survey_template, organization: organization),
      create(:survey_template, organization: organization)
  ]}

  before(:each) do
    assign(:survey_templates, survey_templates)
    assign(:organization, organization)
  end

  it "renders a list of survey_templates" do
    render

    survey_templates.each do |survey_template|
      assert_select "tr>td", :text => survey_template.name
      assert_select "tr>td", :text => survey_template.description
    end
  end
end
