require 'rails_helper'

RSpec.describe "surveys/show", type: :view do
  let(:organization) { create(:organization) }
  let(:survey) { create(:survey, organization: organization) }

  before(:each) do
    assign(:survey, survey)
    assign(:record, survey)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{survey.name}/)
    expect(rendered).to match(/#{survey.description}/)
  end
end
