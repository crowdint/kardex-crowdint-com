module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type
      when :notice
        "alert-success"   # Green
      when :error
        "alert-danger"    # Red
      when :alert
        "alert-warning"   # Yellow
      when :success
        "alert-info"      # Blue
      else
        flash_type.to_s
    end
  end

  def show_badges
    if @badges.empty?
      render 'shared/default_badge_message'
    else
      render partial: 'shared/badge', collection: @badges
    end
  end

  def show_workshop_month
    unless WorkshopsEngine::Workshop.all.empty?
      if WorkshopsEngine::Workshop.all.last.date_and_time
        WorkshopsEngine::Workshop.all.last.date_and_time.strftime("%B")
      end
    end
  end

  def show_last_workshop
    if WorkshopsEngine::Workshop.all.where(is_published: true).last
      render partial: 'shared/workshop', locals: { workshop:
        WorkshopsEngine::Workshop.all.where(is_published: true).last }
    else
      render 'shared/default_workshop_message'
    end
  end

  def show_workshops
    if @workshops.empty?
      render 'shared/default_workshop_message'
    else
      render partial: 'workshops_list', locals: { workshops:
        @workshops.where(is_published: true) }
    end
  end

  def show_published_workshops
    if @workshops.empty?
      render 'shared/default_workshop_message'
    else
      render partial: 'workshops_list', locals: { workshops: @workshops }
    end
  end

  def define_badge_column
    if params[:controller] == 'users' && params[:action] == 'show'
      'badge-5-col'
    else
      'badge-6-col'
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
end
