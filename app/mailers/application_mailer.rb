# Base mailer class for application
class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@mail.agileplanning.io'
  layout 'mailer'
end
