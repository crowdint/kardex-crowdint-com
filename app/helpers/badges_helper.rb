module BadgesHelper
  def badge_totals
    "#{ current_user.badges.size }/#{ @badges.size }"
  end
end
