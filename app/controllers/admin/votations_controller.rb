class Admin::VotationsController  < Admin::BaseController
  def index
    @votations = Votation.where(created_at: Date.today)
  end

  def new
    @votation = Votation.new
  end

  def create
    @votation = Votation.new(votation_params)
    if @votation.save
      redirect_to admin_votations_path, notice: 'Votation created successfully'
    else
      render :new
    end
  end

  private

  def votation_params
    params.require(:votation).permit(:badge_id, :created_at)
  end
end
