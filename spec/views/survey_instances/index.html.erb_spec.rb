require 'rails_helper'

RSpec.describe "survey_instances/index", type: :view do
  let(:survey_template) { create(:survey_template) }
  let(:survey_instances) {[
      create(:survey_instance, survey_template: survey_template),
      create(:survey_instance, survey_template: survey_template)
  ]}

  before(:each) do
    assign(:survey_template, survey_template)
    assign(:survey_instances, survey_instances)
  end

  it "renders a list of survey_instances" do
    render

    survey_instances.each do |survey_instance|
      assert_select "tr>td", :text => survey_instance.name
    end
  end
end
