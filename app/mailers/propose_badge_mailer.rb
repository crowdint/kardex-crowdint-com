class ProposeBadgeMailer < ActionMailer::Base
  helper ProposeBadgesHelper

  def badge_proposal(propose_badge, user, email_admins)
    @user = user
    @badge_proposal = propose_badge
    mail(
      from: user,
      to: email_admins,
      subject: 'A new badge was proposed!'
    )
  end
end
