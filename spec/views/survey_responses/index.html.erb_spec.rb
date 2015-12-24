require 'rails_helper'

RSpec.describe "survey_responses/index", type: :view do
  let(:survey) { create(:survey) }
  let!(:survey_responses) {[
      create(:survey_response, survey: survey),
      create(:survey_response, survey: survey)
  ]}

  before(:each) do
    assign(:survey, survey)
  end

  it "renders a list of survey_responses" do
    render

    survey.survey_responses.each do |survey_response|
      # TODO: proper specs
    end
  end
end
