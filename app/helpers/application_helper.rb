module ApplicationHelper
  def show_badges
    if @badges.empty?
      'You don\'t have badges... yet!'
    else
      render partial: 'shared/badge', collection: @badges
    end
  end

  def define_badge_column
    if params[:controller] == 'users' && params[:action] == 'show'
      'badge-info'
    else
      'badge-info-6-col'
    end
  end

  def unknown_image?(badge)
    'unknown-image' unless current_user.badges.include?(badge)
  end

  def badge_earn_icon(badge)
    if params[:controller] == 'badges' and badge.users.include? current_user
      content_tag :div, nil, class: 'badge-earned-icon'
    end
  end
end
