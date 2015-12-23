require 'rails_helper'

RSpec.describe "survey_responses/index", type: :view do
  let(:survey_instance) { create(:survey_instance) }
  let(:survey_responses) {[
      create(:survey_response, survey_instance: survey_instance),
      create(:survey_response, survey_instance: survey_instance)
  ]}

  before(:each) do
    assign(:survey_responses, survey_responses)
  end

  it "renders a list of survey_responses" do
    render

    survey_responses.each do |survey_response|
      assert_select "tr>td", :text => survey_response.user.email
    end
  end
end
