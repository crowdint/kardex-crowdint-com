class ShowDontTellsController < ApplicationController
  layout 'dashboards'

  def index
    @show_dont_tells = ShowDontTellsEngine::ShowDontTell.all
  end
end
