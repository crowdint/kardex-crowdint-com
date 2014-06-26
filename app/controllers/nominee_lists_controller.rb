class NomineeListsController < ApplicationController
  def index
    @nominee_lists = NomineeList.all
  end

  def show
    @nominee_list = NomineeList.find(params[:id])
  end
end
