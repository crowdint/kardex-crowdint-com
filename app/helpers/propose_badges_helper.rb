module ProposeBadgesHelper
  def value_name(value)
    value.name unless value.nil?
  end
end
