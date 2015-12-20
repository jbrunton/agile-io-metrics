require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do
  describe '#form_input' do
    it "returns html for the input" do
      organization = Organization.new(name: 'My Org')
      expected_html = '<input id="organization_name" name="organization[name]" type="text" class="validate" value="My Org" />' +
          '<label for="organization_name">Name</label>'.html_safe

      html = helper.form_input(organization, :name)

      expect(html).to eq(expected_html)
    end
  end
end