module BadgesEngine
  module BadgesHelper
    def show_award(award)
      award.title unless award.nil?
    end

    def show_value(value)
      value.name unless value.nil?
    end

    def show_badge(badge)
      badge.name unless badge.nil?
    end
  end
end
