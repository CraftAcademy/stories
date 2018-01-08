class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail to: @user.email, subject: t('application.mail.new_user_subject')
  end
end
