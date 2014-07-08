class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: [:show, :edit, :update]

  def index
    @badges = if params[:search]
               BadgesEngine::Badge.where("name ILIKE ?", "%#{params[:search]}%")
            else
               BadgesEngine::Badge.all
    end
  end

  def show
  end

  def new
    @badge = BadgesEngine::Badge.new
    @badge.levels.build
  end

  def edit
  end

  def create
    @badge = BadgesEngine::Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path, notice: 'Badge was successfully created.'
    else
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path, notice: 'Badge was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_badge
    @badge = BadgesEngine::Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(
      :name, :image, :description,
      :award_id, :value_id,
      levels_attributes: [
        :tier, :badges_alias, :badge_id
      ]
    )
  end



end
