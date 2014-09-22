class VotationsController < ApplicationController
  layout 'dashboards'

  def index
    @votations = Votation.active?
    @vote = Vote.new
  end
end
