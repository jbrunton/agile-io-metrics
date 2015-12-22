# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

include FactoryGirl::Syntax::Methods

admin = create(:user, email: 'admin@example.com')

2.times do
  org = create(:organization)

  ['Team A', 'Team B'].each do |team_name|
    team = create(:team, organization: org)
    3.times do
      user = create(:user)
      user.add_role :member, team
    end
    admin.add_role :admin, team
  end
end

