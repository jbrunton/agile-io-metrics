require 'rails_helper'

RSpec.describe "surveys/index", type: :view do
  let(:survey_template) { create(:survey_template) }
  let(:surveys) {[
      create(:survey, survey_template: survey_template),
      create(:survey, survey_template: survey_template)
  ]}

  before(:each) do
    assign(:survey_template, survey_template)
    assign(:surveys, surveys)
  end

  it "renders a list of surveys" do
    render

    surveys.each do |survey|
      assert_select "tr>td", :text => survey.name
    end
  end
end
