class VotesController < ApplicationController
  def create
    @vote = Vote.new(votes_params)
    if @vote.save
      redirect_to user_path(current_user), notice: 'Thanks for your voto! :)'
    else
      redirect_to votations_path, notice: @vote.errors.full_messages.first
    end
  end

  private

  def votes_params
    params.require(:vote).permit(
      :votation_id, :user_id, :voted_user_id, :reason
    )
  end
end
