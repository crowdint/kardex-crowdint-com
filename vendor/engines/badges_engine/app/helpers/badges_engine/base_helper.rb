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

    def define_badge_column
      if params[:controller] == 'users' && params[:action] == 'show'
        'badge-5-col'
      else
        'badge-6-col'
      end
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

    def show_earned_date(badge)
      current_user.find_badge_assignment(badge).created_at.strftime('%B %Y')
    end

    def show_value(value)
      value.name unless value.nil?
    end

    def show_award(award)
      award.title unless award.nil?
    end

    def show_badge(badge)
      badge.name unless badge.nil?
    end
  end
end
