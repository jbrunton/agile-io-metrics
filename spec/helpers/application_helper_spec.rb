require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#form_input' do
    it "returns html for the input" do
      organization = build(:organization, name: 'My Org')

      html = helper.form_input(organization, :name)

      expected_html = '<input id="organization_name" name="organization[name]" type="text" class="validate" value="My Org" />' +
          '<label for="organization_name">Name</label>'.html_safe
      expect(html).to eq(expected_html)
    end

    it "adds validation errors" do
      organization = build(:organization, name: '')
      organization.save

      html = helper.form_input(organization, :name)

      expected_html = '<input id="organization_name" name="organization[name]" type="text" class="validate invalid" value="" />' +
          '<label for="organization_name" data-error="can&#39;t be blank">Name</label>'.html_safe
      expect(html).to eq(expected_html)
    end
  end
end