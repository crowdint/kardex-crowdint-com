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
    if current_user.is_admin?
      link_to "Admin Power", admin_users_path, class: 'profile-admin'
    end
  end
end
