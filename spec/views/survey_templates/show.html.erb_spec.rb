require 'rails_helper'

RSpec.describe "survey_templates/show", type: :view do
  let(:organization) { create(:organization) }
  let(:survey_template) { create(:survey_template, organization: organization) }

  before(:each) do
    assign(:survey_template, survey_template)
    assign(:record, survey_template)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{survey_template.name}/)
    expect(rendered).to match(/#{survey_template.description}/)
  end
end
