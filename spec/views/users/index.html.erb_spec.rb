require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
        create(:user),
        create(:user)
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => /user.*@example.com/, :count => 2
  end
end
