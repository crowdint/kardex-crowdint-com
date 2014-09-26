class WorkshopNotificationMailer < ActionMailer::Base
  # helper WorkshopNotificationHelper

  def workshop_notification(user, all_emails)
    @user = user
    mail(
      from: @user.email,
      to: all_emails,
      subject: 'Kardex: A new workshop was published!'
    )
  end
end
