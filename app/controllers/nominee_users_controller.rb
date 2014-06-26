class NomineeUsersController < ApplicationController
  def new
    @nominee_user = NomineeUser.new
  end

  def create
    @nominee_user = NomineeUser.new(badge_proposal_params)
    if @badge_proposal.save
      redirect_to user_path(current_user), notice: 'Nomination sent successfully'
    else
      render :new
    end
  end

  private

  def nominee_user_params
    params.require(:nominee_user).permit(
      :badge_id,
      :user_id,
      :why
    )
  end
end
