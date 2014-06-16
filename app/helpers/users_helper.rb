module UsersHelper
  def position
    @user.position.name unless @user.position.nil?
  end
end
