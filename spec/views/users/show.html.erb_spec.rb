require 'rails_helper'

RSpec.describe "users/show", type: :view do
  let(:current_user) { create(:user) }
  before(:each) do
    sign_in current_user
    @user = assign(:user, current_user)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@user.email}/)
  end
end
