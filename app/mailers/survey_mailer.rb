class SurveyMailer < ApplicationMailer
  def notify_survey(user, survey)
    @user = user
    @survey = survey
    mail(to: @user.email, subject: "Please complete #{survey.name}")
  end
end
