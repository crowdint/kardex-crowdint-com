class ProposeBadge < ActiveRecord::Base
  validates :name, presence: true
end
