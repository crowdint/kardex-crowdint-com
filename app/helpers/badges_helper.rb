module BadgesHelper
  def badge_totals(user)
    "#{ user.badges.size }/#{ @badges.size }"
  end
end
