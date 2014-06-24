module UsersHelper
  def position
    @position.name unless @position.nil?
  end

  def redirect_url
    if user_signed_in?
      user_path(current_user)
    else
      google_apps_sign_in_path
    end
  end
end
