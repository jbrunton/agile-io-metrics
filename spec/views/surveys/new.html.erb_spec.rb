require 'rails_helper'

RSpec.describe "surveys/new", type: :view do
  before(:each) do
    assign(:survey, Survey.new(
      :name => "MyString",
      :description => "MyText",
      :organization => nil
    ))
  end

  it "renders new survey form" do
    render

    assert_select "form[action=?][method=?]", surveys_path, "post" do

      assert_select "input#survey_name[name=?]", "survey[name]"

      assert_select "textarea#survey_description[name=?]", "survey[description]"

      assert_select "input#survey_organization_id[name=?]", "survey[organization_id]"
    end
  end
end
