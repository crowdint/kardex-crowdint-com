class BadgesController < ApplicationController
  layout 'dashboards'

  def index
    @badges = BadgesEngine::Badge.all
  end
end
