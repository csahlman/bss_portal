class UserMailer < ActionMailer::Base
  default from: "app9798771@heroku.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.first_login.subject
  #
  def first_login(user, password)
    @user = user
    @password = password

    mail to: user.email, subject: "Boston Startup School Teacher Portal"
  end

  def confirm_teaching(user, lesson)
    @user = user
    @lesson = lesson

    mail to: user.email, subject: "You have been assigned to teach a course for BSS"
  end
end
