class Admin::NomineeListsController < Admin::BaseController
  def new
    @nominee_list = NomineeList.new
  end

  def create
    @nominee_list = NomineeList.new(nominee_list_params)
    if @nominee_list.save
      redirect_to admin_root_path, notice: 'Nominee list created successfully'
    else
      render :new
    end
  end

  private

  def nominee_list_params
    params.require(:nominee_list).permit(
      :badge_id, user_ids: [])
  end
end
