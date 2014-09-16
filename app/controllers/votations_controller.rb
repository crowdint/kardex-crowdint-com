class VotationsController < ApplicationController
  layout 'dashboards'

  def index
    @votations = Votation.current
    @vote = Vote.new
  end
end
