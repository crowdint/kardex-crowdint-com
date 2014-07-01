class ProposeBadgesController < ApplicationController
  def new
    @propose_badge = ProposeBadge.new
  end

  def create
    render :new
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
