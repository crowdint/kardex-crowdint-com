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

  def show_public_workshops(active)
    if active
      show_active_published_workshops
    else
      show_published_workshops
    end
  end

  def show_active_published_workshops
    if @workshops.active.published
      render partial: 'workshops_list', locals:
        { workshops: @workshops.published.active }
    else
      render 'shared/default_workshop_message'
    end
  end

  def show_published_workshops
    if @workshops.published
      render partial: 'workshops_list', locals:
        { workshops: @workshops.published }
    else
      render 'shared/default_workshop_message'
    end
  end

  def show_last_active_published_workshop
    if WorkshopsEngine::Workshop.active.published.last
      render partial: 'shared/workshop', locals: { workshop:
        WorkshopsEngine::Workshop.active.published.last }
    else
      render 'shared/default_workshop_message'
    end
  end

  def show_workshop_month
    if WorkshopsEngine::Workshop.all.active.published.last
      if WorkshopsEngine::Workshop.all.active.published.last.date_and_time
        WorkshopsEngine::Workshop.all.active.published.
          last.date_and_time.strftime("%B")
      end
    end
  end

  def show_presentations(active)
    if active
      show_active_presentations
    else
      show_all_presentations
    end
  end

  def show_all_presentations
    if @presentations.empty?
      render 'shared/default_show_dont_tell_message'
    else
      render partial: 'presentations_list', locals: { presentations:
        @presentations }
    end
  end

  def show_active_presentations
    if @presentations.active.empty?
      render 'shared/default_show_dont_tell_message'
    else
      render partial: 'presentations_list', locals: { presentations:
        @presentations.active }
    end
  end

  def show_next_wednesday_presentations
    if PresentationsEngine::Presentation.next_wednesday.empty?
      render 'shared/default_show_dont_tell_message'
    else
      render partial: 'shared/presentation',
      collection: PresentationsEngine::Presentation.next_wednesday
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

  def badges_admin
    Role.find_by_name('badges admin')
  end

  def presentations_admin
    Role.find_by_name('presentations admin')
  end

  def workshops_admin
    Role.find_by_name('workshops admin')
  end

  def can_edit_all?
    current_user.is_admin ||
      current_user == @user
  end

  def can_edit_badges?
    current_user.is_admin ||
      current_user.roles.include?(badges_admin)
  end

  def needs_extra_name_field?
    current_user.roles.include?(badges_admin) && !can_edit_all?
  end
end
