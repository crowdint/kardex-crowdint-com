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
end
