class ProposeBadge < ActiveRecord::Base
  validates :name, presence: true

  has_and_belongs_to_many :users

  belongs_to :value, class_name: 'BadgesEngine::Value',
    foreign_key: 'value_id'
end
