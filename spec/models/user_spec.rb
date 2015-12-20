require 'rails_helper'

RSpec.describe User, type: :model do
  it "requires an email" do
    user = build(:user, email: '')
    expect(user).not_to be_valid
  end

  it "requires a valid email" do
    user = build(:user, email: 'not.valid')
    expect(user).not_to be_valid
  end

  it "requires a unique email" do
    create(:user, email: 'example@example.com')
    user = build(:user, email: 'example@example.com')
    expect(user).not_to be_valid
  end

  it "validates the email successsfully" do
    user = build(:user, email: 'example@example.com')
    expect(user).to be_valid
  end
end
