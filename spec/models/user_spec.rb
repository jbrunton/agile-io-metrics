require 'rails_helper'

RSpec.describe User, type: :model do
  it "requires an email" do
    user = User.create(email: '')
    expect(user).not_to be_valid
  end

  it "requires a valid email" do
    user = User.create(email: 'not.valid')
    expect(user).not_to be_valid
  end

  it "requires a unique email" do
    User.create(email: 'example@example.com')
    user = User.create(email: 'example@example.com')
    expect(user).not_to be_valid
  end

  it "validates the email successsfully" do
    user = User.create(email: 'example@example.com')
    expect(user).to be_valid
  end
end
