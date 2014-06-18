module UsersHelper
  def position
    @position.name unless @position.nil?
  end
end
