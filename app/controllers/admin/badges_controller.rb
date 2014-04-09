class Admin::BadgesController < Admin::BaseController
  before_filter :load_badge, if: -> { params[:id] }

  respond_to :html

  def index
    respond_with @badges = Badge.all
  end

  def new
    respond_with @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge)
    @badge.save
    respond_with @badge, location: admin_badges_path
  end

  def edit
  end

  def update
    @badge.update_attributes badge
    @badge.save
    respond_with @badge, location: admin_badges_path
  end

  def destroy
    @badge.destroy
    respond_with @badge, location: admin_badges_path
  end

  private
  def badge
    params.require(:badge).permit(:name, :description, user_ids: [])
  end

  def load_badge
    @badge = Badge.find(params[:id])
  end
end
