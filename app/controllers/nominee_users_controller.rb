class NomineeUsersController < ApplicationController
  def new
    @nominee_user = NomineeUser.new
  end

  def create
    @nominee_user = NomineeUser.new(nominee_user_params)
    if @nominee_user.save
      redirect_to user_path(current_user), notice: 'Nomination sent successfully'
      NominateUserMailer.nominate_user_notification(
        @nominee_user, current_user, admin_emails
      ).deliver
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
