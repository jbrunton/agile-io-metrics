require 'rails_helper'

RSpec.describe "survey_instances/index", type: :view do
  before(:each) do
    assign(:survey_instances, [
      SurveyInstance.create!(
        :name => "Name",
        :survey => nil
      ),
      SurveyInstance.create!(
        :name => "Name",
        :survey => nil
      )
    ])
  end

  it "renders a list of survey_instances" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
