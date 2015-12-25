crumb :root do
  link 'Home', root_path
end

crumb :organizations do
  link 'Organizations', organizations_path
end

crumb :organization do |organization|
  link organization.name, organization_path(organization)
  parent :organizations
end

crumb :teams do |organization|
  link 'Teams', organization_teams_path(organization)
  parent :organization, organization
end

crumb :team do |team|
  link team.name, team_path(team)
  parent :teams, team.organization
end

crumb :survey_template do |survey_template|
  link survey_template.name, survey_template_path(survey_template)
  parent :organization, survey_template.organization
end

crumb :survey do |survey|
  link survey.name, survey_path(survey)
  parent :survey_template, survey.survey_template
end

crumb :survey_responses do |survey|
  link 'Responses', survey_survey_responses_path(survey)
  parent :survey_template, survey.survey_template
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).