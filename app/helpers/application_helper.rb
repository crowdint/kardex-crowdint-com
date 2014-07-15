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

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
end
