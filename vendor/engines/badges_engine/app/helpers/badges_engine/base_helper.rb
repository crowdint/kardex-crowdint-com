module BadgesEngine
  module BaseHelper
    def show_badges
      if @badges.empty?
        render partial: 'badges_engine/shared/default_badge_message'
      else
        render partial: 'badges_engine/shared/badge', collection: @badges
      end
    end

    def unknown_image?(badge)
      'badge-unknown' unless current_user.badges.include?(badge)
    end

    def badge_earn_icon(badge)
      if params[:controller] == 'badges' and badge.users.include? current_user
        content_tag :div, nil, class: 'badge-earned-icon'
      end
    end

    def badge_totals(user)
      "#{ user.badges.size }/#{ @badges.size }"
    end
  end
end
