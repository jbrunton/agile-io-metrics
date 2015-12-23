require 'rails_helper'

RSpec.describe "survey_instances/new", type: :view do
  before(:each) do
    assign(:survey_instance, SurveyInstance.new(
      :name => "MyString",
      :survey => nil
    ))
  end

  it "renders new survey_instance form" do
    render

    assert_select "form[action=?][method=?]", survey_instances_path, "post" do

      assert_select "input#survey_instance_name[name=?]", "survey_instance[name]"

      assert_select "input#survey_instance_survey_id[name=?]", "survey_instance[survey_id]"
    end
  end
end
