require 'rails_helper'

RSpec.describe "survey_responses/show", type: :view do
  before(:each) do
    @survey_response = assign(:survey_response, SurveyResponse.create!(
      :user => nil,
      :survey_instance => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
