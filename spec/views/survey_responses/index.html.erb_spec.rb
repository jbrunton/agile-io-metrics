require 'rails_helper'

RSpec.describe "survey_responses/index", type: :view do
  before(:each) do
    assign(:survey_responses, [
      SurveyResponse.create!(
        :user => nil,
        :survey_instance => nil
      ),
      SurveyResponse.create!(
        :user => nil,
        :survey_instance => nil
      )
    ])
  end

  it "renders a list of survey_responses" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
