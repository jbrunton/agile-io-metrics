require 'rails_helper'

RSpec.describe "survey_instances/edit", type: :view do
  before(:each) do
    @survey_instance = assign(:survey_instance, SurveyInstance.create!(
      :name => "MyString",
      :survey => nil
    ))
  end

  it "renders the edit survey_instance form" do
    render

    assert_select "form[action=?][method=?]", survey_instance_path(@survey_instance), "post" do

      assert_select "input#survey_instance_name[name=?]", "survey_instance[name]"

      assert_select "input#survey_instance_survey_id[name=?]", "survey_instance[survey_id]"
    end
  end
end
