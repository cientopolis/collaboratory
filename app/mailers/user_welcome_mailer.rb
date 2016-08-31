class UserWelcomeMailer < ApplicationMailer
  layout false

  SITE_NAME = "Cientópolis"
  DEFAULT_SUBJECT = "Bienvenido a #{SITE_NAME}! Tu cuenta & lo que sigue"
  SITE_URL = "http://colaboratorio.cientopolis.org"

  def welcome_user(user, project_name=nil)
    @user = user
    @email_to = user.email
    @welcome_location = project_name ? project_name : SITE_NAME
    @site_url = SITE_URL
    mail(to: @email_to, subject: DEFAULT_SUBJECT)
  end
end
