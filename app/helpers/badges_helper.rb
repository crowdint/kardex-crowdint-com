module BadgesHelper
  def award_title(award)
    badge.award.title unless badge.award.nil?
  end

  def value_name(value)
    badge.value.name unless badge.value.nil?
  end
end
