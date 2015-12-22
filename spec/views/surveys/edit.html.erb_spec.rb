require 'rails_helper'

RSpec.describe "surveys/edit", type: :view do
  let(:organization) { create(:organization) }
  let(:survey) { create(:survey, organization: organization) }

  before(:each) do
    assign(:survey, survey)
    assign(:record, survey)
  end

  it "renders the edit survey form" do
    render

    assert_select "form[action=?][method=?]", survey_path(survey), "post" do

      assert_select "input#survey_name[name=?]", "survey[name]"

      assert_select "textarea#survey_description[name=?]", "survey[description]"
    end
  end
end
