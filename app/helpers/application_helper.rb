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
end
