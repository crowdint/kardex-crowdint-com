module BadgesEngine
  class Award < ActiveRecord::Base
    has_many :badges
  end
end
