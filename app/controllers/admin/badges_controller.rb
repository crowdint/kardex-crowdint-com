class Admin::BadgesController < Admin::AchievablesController
  def resource_name
    "badge"
  end

  def index_path
    admin_badges_path
  end
end
