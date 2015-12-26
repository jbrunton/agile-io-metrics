# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

include FactoryGirl::Syntax::Methods

admin = create(:user, email: 'admin@example.com')

['Organization A', 'Organization B'].each do |org_name|
  org = create(:organization, name: org_name)
  admin.add_role :admin, org

  ['Team A', 'Team B', 'Team C'].each do |team_name|
    team = create(:team, name: team_name, organization: org)
    3.times do
      user = create(:user)
      user.add_role :member, team
    end
    admin.add_role :admin, team
  end

  survey_template = create(:survey_template, organization: org, name: 'Squad Health Check')
  create :survey_question, survey_template: survey_template, title: 'Support',
      text: 'Awesome: We always get great support & help when we ask for it! OR: We keep getting stuck because we can’t get the support & help that we ask for.'
  create :survey_question, survey_template: survey_template, title: 'Teamwork',
      text: 'We feel that the communication within the Team is easy and happens often enough. There are no grudges or bad feelings. We receive enough mentoring on this subject.'
  create :survey_question, survey_template: survey_template, title: 'Pawns/Players',
      text: 'As individuals and as a Team we feel that in the big picture we are more than just chess-pawns, game pieces to be moved around. We feel that we are actually players who decide where the pawns are moved.'
  create :survey_question, survey_template: survey_template, title: 'Mission',
      text: 'It is very clear to us what the mission and vision of our work is. The mission is defined as are the values behind it. The Product Owner updates us on the direction where we should be headed and ensures that our understanding of the mission is updated. We understand what is value to the customer through a perfectly sharpened blade-like Product Backlog.'
  create :survey_question, survey_template: survey_template, title: 'Codebase Health',
      text: 'As a team and as individuals we feel that the current state of our code-base is very healthy, it can be easily read, tested against and re-factored. If a major changes to the software came tomorrow we would smile because it would be so easy to add it due to the dynamic architecture design and easily manageable code-base we have.'
  create :survey_question, survey_template: survey_template, title: 'Ease of Release',
      text: 'Awesome: Releasing is simple, safe, painless & mostly automated. OR: Releasing is risky, painful, lots of manual work, and takes forever.'
  create :survey_question, survey_template: survey_template, title: 'Learning',
      text: 'Awesome: We’re learning lots of interesting stuff all the time! OR: We never have time to learn anything'
  create :survey_question, survey_template: survey_template, title: 'Delivering Value',
      text: 'Our Team has a strong feeling that each Iteration very valuable pieces of software are being delivered to the customer with shining, outstandingly honed quality. Our work is brutally measured against a crystal clear Definition of Done and an Acceptance Criteria and change is welcome.'
  create :survey_question, survey_template: survey_template, title: 'Suitable Process',
      text: 'In cooperation with the ScrumMaster or Agile Coach we have crafted ourselves a rock solid process that yields high value stream of features at a steady pace Iteration by Iteration. We do not fear outside interferences, the process does not slow us down, it is not in our way, it is there to serve us so that we can serve the customer.'
  create :survey_question, survey_template: survey_template, title: 'Fun',
      text: 'Our Team is having so much fun that it hardly seems like work coming here on Monday morning.'

  [DateTime.new(2015, 6, 1), DateTime.new(2015, 7, 1), DateTime.new(2015, 8, 1)].each do |survey_date|
    survey = create(:survey,
        survey_template: survey_template,
        name: "Squad Health Check - #{survey_date.strftime('%-d %b %Y')}",
        created_at: survey_date)

    org.teams.each_with_index do |team|
      team.members.each_with_index do |user, user_index|
        survey_response = create(:survey_response, survey: survey, user: user)
        survey_template.survey_questions.each_with_index do |question, question_index|
          rating = rand(3).to_f / 2 +
              (user_index % 3).to_f / 2 - 0.5 +
              2 * question_index.to_f / survey_template.survey_questions.length;
          create(:survey_answer,
              survey_response: survey_response,
              survey_question: question,
              mood: [Mood::BAD, Mood::MEH, Mood::GOOD][[rating.to_i, 2].min])
        end
      end
    end
  end
end

