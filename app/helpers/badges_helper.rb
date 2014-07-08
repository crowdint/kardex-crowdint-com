module BadgesHelper
  def badge_totals(user)
    "#{ user.badges.size }/#{ @badges.size }"
  end

  def current_badge(badge)
    if badge == @badge
      'row badge-sidebar-current-badge'
    else
      'row badge-sidebar-badge'
    end
  end
end
