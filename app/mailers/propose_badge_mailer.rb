class ProposeBadgeMailer < ActionMailer::Base
  helper ProposeBadgesHelper

  def badge_proposal_notification(propose_badge, user, admin_emails)
    @user = user
    @badge_proposal = propose_badge
    mail(
      from: @user.email,
      to: admin_emails,
      subject: 'Kardex: A new badge was proposed!'
    )
  end
end
