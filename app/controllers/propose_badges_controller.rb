class ProposeBadgesController < ApplicationController
  def create
    @propose_badge = ProposeBadge.new(propose_badge_params)
    if @propose_badge.save
      ProposeBadgeMailer.badge_proposal_notification(
        @propose_badge, current_user, admin_emails
      ).deliver
      redirect_to user_path(current_user), notice: 'Badge proposal sent successfully'
    else
      render :new
    end
  end

  private

  def propose_badge_params
    params.require(:propose_badge).permit(
      :name,
      :value_id,
      :description,
      user_ids: []
    )
  end
end
