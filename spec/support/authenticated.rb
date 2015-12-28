RSpec.shared_context 'authenticated' do
  let(:current_user) { create(:user) }

  if [:controller, :view].include? metadata[:type]
    before(:each) { sign_in current_user }
  else
    before(:each) { login_as current_user }
  end
end