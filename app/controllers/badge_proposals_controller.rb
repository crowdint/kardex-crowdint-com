class BadgeProposalsController < ApplicationController
  def new
    @badge_proposal = BadgeProposal.new
  end

  def create
    @badge_proposal = BadgeProposal.new(badge_proposal_params)
    if @badge_proposal.save
      redirect_to root_path, notice: 'Badge proposal sended successfully'
    else
      render :new
    end
  end

  private

  def badge_proposal_params
    params.require(:badge_proposal).permit(
      :badge_id,
      :user_id,
      :why
    )
  end
end
