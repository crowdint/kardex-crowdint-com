class NominateUserMailer < ActionMailer::Base
  helper NomineeUsersHelper

  def nominate_user_notification(nominated_user, user, admin_emails)
    @user = user
    @nominated_user = nominated_user
    mail(
      from: @user.email,
      to: admin_emails,
      subject: 'A user was nominated!'
    )
  end
end
