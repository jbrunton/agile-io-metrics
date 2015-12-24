require 'rails_helper'

RSpec.describe "survey_instances/new", type: :view do
  let(:survey_template) { create(:survey_template) }
  let(:survey_instance) { build(:survey_instance, survey_template: survey_template) }

  before(:each) do
    assign(:survey_template, survey_template)
    assign(:survey_instance, survey_instance)
    assign(:record, [survey_template, survey_instance])
  end

  it "renders new survey_instance form" do
    render

    assert_select "form[action=?][method=?]", survey_template_survey_instances_path(survey_template), "post" do

      assert_select "input#survey_instance_name[name=?]", "survey_instance[name]"
    end
  end
end
