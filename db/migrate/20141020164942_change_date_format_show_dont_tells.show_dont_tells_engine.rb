# This migration comes from show_dont_tells_engine (originally 20141020164259)
class ChangeDateFormatShowDontTells < ActiveRecord::Migration
  def change
  	change_column :show_dont_tells_engine_show_dont_tells, :date, :date
  end
end
