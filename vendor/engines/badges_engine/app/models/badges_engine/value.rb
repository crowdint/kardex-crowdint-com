module BadgesEngine
  class Value < ActiveRecord::Base
    has_many :badges
  end
end
