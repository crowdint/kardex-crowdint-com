class Vote < ActiveRecord::Base
  belongs_to :votation
  belongs_to :user
  belongs_to :voted_user, class_name: 'User'

  validates :user_id, presence: true, numericality: true
  validates :voted_user_id, presence: true, numericality: true
  validates :votation_id, presence: true, numericality: true
end
