class Candidate < ActiveRecord::Base
  belongs_to :vote_event
  has_and_belongs_to_many :users

  accepts_nested_attributes_for :users, reject_if: :all_blank

  before_save :assigns_users_if_empty

  private

  def assigns_users_if_empty
    if self.user_ids.empty?
      self.user_ids = User.ids
    end
  end
end
