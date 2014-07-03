module NomineeUsersHelper
  def user_name(user)
    user.name unless user.nil?
  end

  def badge_name(badge)
    badge.name unless badge.nil?
  end
end
