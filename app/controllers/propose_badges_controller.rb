class ProposeBadgesController < ApplicationController
  def new
    @propose_badge = ProposeBadge.new
  end

  def create
    @propose_badge = ProposeBadge.new(propose_badge_params)
    if @propose_badge.save
      redirect_to user_path(current_user), notice: 'Badge proposal sent successfully'
      ProposeBadgeMailer.badge_proposal(@propose_badge, current_user, email_admins)
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
