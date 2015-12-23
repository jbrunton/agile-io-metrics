require 'rails_helper'

RSpec.describe "survey_instances/new", type: :view do
  let(:survey) { create(:survey) }
  let(:survey_instance) { build(:survey_instance, survey: survey) }

  before(:each) do
    assign(:survey, survey)
    assign(:survey_instance, survey_instance)
    assign(:record, [survey, survey_instance])
  end

  it "renders new survey_instance form" do
    render

    assert_select "form[action=?][method=?]", survey_survey_instances_path(survey), "post" do

      assert_select "input#survey_instance_name[name=?]", "survey_instance[name]"
    end
  end
end
