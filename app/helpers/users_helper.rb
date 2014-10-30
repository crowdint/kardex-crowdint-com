module UsersHelper
  def profile_picture
    image_tag current_user.picture_url
  end

  def redirect_url
    if user_signed_in?
      user_path(current_user)
    else
      google_apps_sign_in_path
    end
  end

  def logo_redirect_url
    if root_path and user_signed_in?
      user_path(current_user)
    else
      root_path
    end
  end

  def link_to_admin
    if current_user.is_admin? or current_user.roles.any?
      link_to 'Admin Power', admin_users_path, class: 'profile-admin'
    end
  end

  def get_skills(name)
    case name
    when 'Development'
      Skill.filter_by_name('developer')
    when 'Design'
      Skill.filter_by_name('design')
    else
      Skill.filter_by_name('admin')
    end
  end
end
