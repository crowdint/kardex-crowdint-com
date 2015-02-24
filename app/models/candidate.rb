class Candidate < ActiveRecord::Base
  belongs_to :vote_event
  has_and_belongs_to_many :users
end
