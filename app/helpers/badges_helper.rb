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

  def owned_badge?(badge)
    'search-earned-ico' if current_user.badges.include?(badge)
  end

  def show_value(value)
    value.name unless value.nil?
  end
end
