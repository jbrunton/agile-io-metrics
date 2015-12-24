require 'rails_helper'

RSpec.describe "survey_responses/new", type: :view do
  let(:survey) { create(:survey) }
  let(:survey_response) { build(:survey_response, survey: survey) }

  before(:each) do
    assign(:survey, survey)
    assign(:survey_response, survey_response)
    assign(:record, [survey, survey_response])
  end

  it "renders new survey_response form" do
    render

    assert_select "form[action=?][method=?]", survey_survey_responses_path(survey), "post"
  end
end
