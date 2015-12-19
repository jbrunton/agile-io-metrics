require 'rails_helper'

RSpec.describe Organization, type: :model do
  it "requires a name" do
    organization = Organization.create(name: '')
    expect(organization).not_to be_valid
  end
end
