require 'rails_helper'

RSpec.describe "survey_responses/new", type: :view do
  before(:each) do
    assign(:survey_response, SurveyResponse.new(
      :user => nil,
      :survey_instance => nil
    ))
  end

  it "renders new survey_response form" do
    render

    assert_select "form[action=?][method=?]", survey_responses_path, "post" do

      assert_select "input#survey_response_user_id[name=?]", "survey_response[user_id]"

      assert_select "input#survey_response_survey_instance_id[name=?]", "survey_response[survey_instance_id]"
    end
  end
end
