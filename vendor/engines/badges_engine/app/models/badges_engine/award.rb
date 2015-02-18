module BadgesEngine
  class Award < ActiveRecord::Base
    has_many :badges

    validates :title, presence: true
  end
end
