class Admin::VoteEventsController < Admin::BaseController
  before_action :find_vote_event, only: [:destroy, :show, :update]

  def index
    @vote_events = VoteEvent.active?
  end

  def previous
    @vote_events = VoteEvent.active?(false)
  end

  def new
    @vote_event = VoteEvent.new
    @vote_event.build_candidate
  end

  def create
    @vote_event = VoteEvent.new(vote_event_params)
    if @vote_event.save
      redirect_to admin_vote_events_path, notice: 'Vote event created successfully'
    else
      render :new
    end
  end

  def destroy
    @vote_event.destroy
    redirect_to admin_vote_events_path, notice: 'Vote event deleted'
  end

  def show
    @votes = @vote_event.votes.
             select(:voted_user_id).
             group(:voted_user_id).count(:voted_user_id)
    @nominated = User.order_by_votes(@votes)
  end

  def update
    @vote_event.update_column(:is_open, false)
    redirect_to admin_vote_events_path, notice: 'Vote event archived!'
  end

  private

  def find_vote_event
    @vote_event = VoteEvent.find(params[:id])
  end

  def vote_event_params
    params.require(:vote_event).permit(
      :badge_id,
      :date,
      candidate_attributes: [
        user_ids: []
      ]
    )
  end
end
