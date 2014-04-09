class Admin::AchievablesController < Admin::BaseController
  def index
    @badges = Badge.all
  end
end
