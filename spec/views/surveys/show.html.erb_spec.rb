require 'rails_helper'

RSpec.describe "surveys/show", type: :view do
  before(:each) do
    survey = assign(:survey, create(:survey, name: 'Name'))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
