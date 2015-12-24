require 'rails_helper'

RSpec.describe "surveys/show", type: :view do
  before(:each) do
    survey = assign(:survey, Survey.create!(
      :name => "Name",
      :survey_template => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
