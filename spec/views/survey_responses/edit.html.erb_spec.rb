require 'rails_helper'

RSpec.describe "survey_responses/edit", type: :view do
  before(:each) do
    @survey_response = assign(:survey_response, SurveyResponse.create!(
      :user => nil,
      :survey_instance => nil
    ))
  end

  it "renders the edit survey_response form" do
    render

    assert_select "form[action=?][method=?]", survey_response_path(@survey_response), "post" do

      assert_select "input#survey_response_user_id[name=?]", "survey_response[user_id]"

      assert_select "input#survey_response_survey_instance_id[name=?]", "survey_response[survey_instance_id]"
    end
  end
end
