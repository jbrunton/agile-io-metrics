require 'rails_helper'

RSpec.describe "survey_responses/new", type: :view do
  let(:survey_instance) { create(:survey_instance) }
  let(:survey_response) { build(:survey_response, survey_instance: survey_instance) }

  before(:each) do
    assign(:survey_instance, survey_instance)
    assign(:survey_response, survey_response)
    assign(:record, [survey_instance, survey_response])
  end

  it "renders new survey_response form" do
    render

    assert_select "form[action=?][method=?]", survey_instance_survey_responses_path(survey_instance), "post"
  end
end
