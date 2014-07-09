module BadgesHelper
  def image_badge(badge)
    if badge.image_url
      image_tag badge.image_url
    else
      image_tag 'no-image.svg'
    end
  end
end
