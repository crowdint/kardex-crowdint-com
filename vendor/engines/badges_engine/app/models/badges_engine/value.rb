module BadgesEngine
  class Value < ActiveRecord::Base
    has_many :badges

    validates :name, presence: true, uniqueness: true
  end
end
