class VoteEventsController < ApplicationController
  layout 'dashboards'

  def index
    @vote_events = VoteEvent.active?
    @vote = Vote.new
  end
end
