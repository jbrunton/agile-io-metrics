require 'rails_helper'

RSpec.describe "surveys/index", type: :view do
  let(:organization) { create(:organization) }
  let(:surveys) {[
      create(:survey, organization: organization),
      create(:survey, organization: organization)
  ]}

  before(:each) do
    assign(:surveys, surveys)
    assign(:organization, organization)
  end

  it "renders a list of surveys" do
    render

    surveys.each do |survey|
      assert_select "tr>td", :text => survey.name
      assert_select "tr>td", :text => survey.description
    end
  end
end
