class Admin::VotationsController  < Admin::BaseController
  before_action :find_votation, only: [:destroy, :show, :update]

  def index
    @votations = Votation.active?
  end

  def previous
    @votations = Votation.active?(false)
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

  def destroy
    @votation.destroy
    redirect_to admin_votations_path, notice: 'Votation deleted'
  end

  def show
    @votes = @votation.votes.select(:voted_user_id).
      group(:voted_user_id).count(:voted_user_id)
    @nominated = User.find(@votes.keys)
  end

  def update
    @votation.update_column(:is_open, false)
    redirect_to admin_votations_path, notice: 'Votation archived!'
  end

  private

  def find_votation
    @votation = Votation.find(params[:id])
  end

  def votation_params
    params.require(:votation).permit(:badge_id, :date)
  end
end
