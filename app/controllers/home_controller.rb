class HomeController < ApplicationController
  def index
  end

  def try
    admin = User.find_by_email('admin@example.com')
    @team = admin.teams.where(name: 'Team A').first
    @survey = @team.organization.surveys.last
  end
end
