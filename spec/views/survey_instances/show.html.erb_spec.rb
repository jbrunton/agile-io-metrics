require 'rails_helper'

RSpec.describe "survey_instances/show", type: :view do
  before(:each) do
    @survey_instance = assign(:survey_instance, SurveyInstance.create!(
      :name => "Name",
      :survey_template => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
