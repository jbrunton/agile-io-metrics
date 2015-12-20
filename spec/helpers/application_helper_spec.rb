require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#form_input' do
    it "returns html for the input" do
      organization = build(:organization, name: 'My Org')
      expected_html = '<input id="organization_name" name="organization[name]" type="text" class="validate" value="My Org" />' +
          '<label for="organization_name">Name</label>'.html_safe

      html = helper.form_input(organization, :name)

      expect(html).to eq(expected_html)
    end
  end
end