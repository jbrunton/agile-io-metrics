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

  describe "#mood_img" do
    it "returns an empty string when passed nil" do
      expect(helper.mood_img(nil)).to eq('')
    end

    it "returns a mood image when given a mood" do
      expect(helper.mood_img(Mood.GOOD)).to eq('<img src="/moods/good.png" />')
    end

    it "returns a mood image based on a rating" do
      expect(helper.mood_img(0.5)).to eq('<img src="/moods/meh.png" />')
    end
  end

  describe "#header_for" do
    it "renders the header for the resource" do
      survey = create(:survey, name: 'Some Survey')
      expect(helper.header_for(survey)).to eq '<div class="row">' +
        '<div class="col s10"><h3>Some Survey</h3></div>' +
        '<div class="col s2"><a href="/surveys/1/edit" class="btn btn-flat right waves-effect waves-teal">Edit</a></div>' +
        '</div>'
    end
  end
end