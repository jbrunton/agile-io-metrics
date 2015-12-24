require 'rails_helper'

RSpec.describe "survey_responses/index", type: :view do
  let(:survey_instance) { create(:survey_instance) }
  let!(:survey_responses) {[
      create(:survey_response, survey_instance: survey_instance),
      create(:survey_response, survey_instance: survey_instance)
  ]}

  before(:each) do
    assign(:survey_instance, survey_instance)
  end

  it "renders a list of survey_responses" do
    render

    survey_instance.survey_responses.each do |survey_response|
      # TODO: proper specs
    end
  end
end
