class NominateUserMailer < ActionMailer::Base
  helper NomineeUsersHelper

  def nominate_user_notification(nominated_user, user, admin_emails)
    @user = user
    @nominated_user = nominated_user
    mail(
      from: 'kardex@crowdint.com',
      to: admin_emails,
      subject: 'Kardex: A user was nominated!'
    )
  end
end
