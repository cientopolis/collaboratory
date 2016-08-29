class UserWelcomeMailer < ApplicationMailer
  layout false

  SITE_NAME = "Cientópolis"
  DEFAULT_SUBJECT = "Welcome to #{SITE_NAME}! Your Account & What’s Next"
  SITE_URL = "http://ec2-52-196-4-55.ap-northeast-1.compute.amazonaws.com"

  def welcome_user(user, project_name=nil)
    @user = user
    @email_to = user.email
    @welcome_location = project_name ? project_name : SITE_NAME
    @site_url = SITE_URL
    mail(to: @email_to, subject: DEFAULT_SUBJECT)
  end
end
