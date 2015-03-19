module BadgesEngine
  class Level < ActiveRecord::Base
    belongs_to :badge
    after_initialize :default_tier

    validates :tier, numericality: { only_integer: true }

    private

    def default_tier
      self.tier ||= 1
    end
  end
end
