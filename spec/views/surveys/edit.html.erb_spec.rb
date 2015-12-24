require 'rails_helper'

RSpec.describe "surveys/edit", type: :view do
  let(:survey_template) { create(:survey_template) }
  let(:survey) { create(:survey, survey_template: survey_template) }

  before(:each) do
    assign(:survey_template, survey_template)
    assign(:survey, survey)
    assign(:record, survey)
  end

  it "renders the edit survey form" do
    render

    assert_select "form[action=?][method=?]", survey_path(survey), "post" do

      assert_select "input#survey_name[name=?]", "survey[name]"
    end
  end
end
