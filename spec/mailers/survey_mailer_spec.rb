require "rails_helper"

RSpec.describe SurveyMailer, type: :mailer do
  describe "#notify_survey" do
    let(:user) { create(:user) }
    let(:survey) { create(:survey, name: 'Example Survey') }

    let!(:email) { SurveyMailer.notify_survey(user, survey).deliver_now }

    it "sends the notify survey email to the user" do
      expect(email.to).to eq([user.email])
      expect(email.from).to eq(['noreply@mail.agileplanning.io'])
    end

    it "specifies the survey in the subject" do
      expect(email.subject).to eq('Please complete Example Survey')
    end

    it "links to the survey" do
      expect(email.body.to_s).to include(new_survey_survey_response_url(survey))
    end
  end
end
