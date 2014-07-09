module BadgesHelper
  def image_badge(badge)
    if badge.image_url
      image_tag badge.image_url
    else
      image_tag 'no-image.svg'
    end
  end

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
