class Admin::VotingsController  < Admin::BaseController
  def index
    @votings = Voting.where(created_at: Date.today)
  end

  def new
    @voting = Voting.new
  end

  def create
    @voting = Voting.new(voting_params)
    if @voting.save
      redirect_to admin_root_path, notice: 'Votation created successfully'
    else
      render :new
    end
  end

  private

  def voting_params
    params.require(:voting).permit(:badge_id, :created_at)
  end
end
