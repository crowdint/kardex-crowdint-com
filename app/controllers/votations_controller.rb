class VotationsController < ApplicationController
  layout 'dashboards'

  def index
    @votations = Votation.all
    @vote = Vote.new
  end
end
