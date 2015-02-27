class Vote < ActiveRecord::Base
  belongs_to :vote_event
  belongs_to :user
  belongs_to :voted_user, class_name: 'User'

  validates :user_id, presence: true, numericality: true
  validates :voted_user_id, presence: true, numericality: true
  validates :vote_event_id, presence: true, numericality: true

  validate :voted?

  private

  def voted?
    if vote_event.users.include? user
      errors.add(:user, 'You already vote for one')
    end
  end
end
